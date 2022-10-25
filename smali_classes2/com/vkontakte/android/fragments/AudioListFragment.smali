.class public Lcom/vkontakte/android/fragments/AudioListFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "AudioListFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;
.implements Lcom/vkontakte/android/audio/player/PlayerListener;
.implements Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;
.implements Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;,
        Lcom/vkontakte/android/fragments/AudioListFragment$SectionViewHolder;,
        Lcom/vkontakte/android/fragments/AudioListFragment$SectionHeaderAdapter;,
        Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;,
        Lcom/vkontakte/android/fragments/AudioListFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Lcom/vk/attachpicker/SupportExternalToolbarContainer;",
        "Lcom/vkontakte/android/audio/player/PlayerListener;",
        "Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;",
        "Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;"
    }
.end annotation


# instance fields
.field private adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field private adapterMainSection:Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

.field private adapterSearchSection:Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

.field private dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

.field private itemProgress:Landroid/widget/ProgressBar;

.field lastState:Lcom/vkontakte/android/audio/player/PlayerState;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private searchRequest:Lme/grishka/appkit/api/APIRequest;

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private uid:I

.field private updateListRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 116
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 74
    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$1;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 86
    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;Lcom/vkontakte/android/fragments/AudioListFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    .line 325
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 526
    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment$5;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$5;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->updateListRunnable:Ljava/lang/Runnable;

    .line 117
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->refresh()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->removeFromLists(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/AudioListFragment;->onLoadTracksList(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->superUpdateList()V

    return-void
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->showContent()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->search(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->localSearch(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->onLoadTracksList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/AudioListFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->setIsSearching(Z)V

    return-void
.end method

.method private applyListChanges()V
    .locals 1

    .prologue
    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->run()V

    .line 478
    return-void
.end method

.method public static filterTracks(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 10
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 648
    .local p0, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 649
    const-string/jumbo v6, " "

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 650
    .local v5, "words":[Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 651
    .local v3, "retList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 652
    .local v2, "localList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v1, 0x0

    .line 653
    .local v1, "i":I
    array-length v7, v5

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v7, :cond_4

    aget-object v4, v5, v6

    .line 654
    .local v4, "word":Ljava/lang/String;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 655
    .local v0, "f":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v9, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    iget-object v9, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 656
    :cond_1
    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 657
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 660
    .end local v0    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    array-length v8, v5

    add-int/lit8 v9, v1, 0x1

    if-le v8, v9, :cond_3

    .line 661
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 662
    invoke-interface {v3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 663
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 665
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 653
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 667
    .end local v4    # "word":Ljava/lang/String;
    :cond_4
    return-object v3
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
.end method

.method private localSearch(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->access$1100(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;Ljava/lang/String;)V

    .line 514
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getCurrentTrackList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->filterTracks(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->onLoadLocalTracksList(Ljava/lang/String;Ljava/util/List;)V

    .line 515
    return-void
.end method

.method private onLoadLocalTracksList(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "searchQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 472
    .local p2, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v0, p2, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->putLocalSearchResult(Ljava/util/List;Ljava/lang/String;)V

    .line 473
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->applyListChanges()V

    .line 474
    return-void
.end method

.method private onLoadTracksList(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "searchQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 467
    .local p2, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v0, p2, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->putSearchResult(Ljava/util/List;Ljava/lang/String;)V

    .line 468
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->applyListChanges()V

    .line 469
    return-void
.end method

.method private onLoadTracksList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 462
    .local p1, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->putTracksList(Ljava/util/List;)V

    .line 463
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->applyListChanges()V

    .line 464
    return-void
.end method

.method private removeFromLists(Ljava/lang/String;)V
    .locals 3
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 105
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 106
    .local v0, "file":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 107
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 108
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->remove(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 109
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 113
    .end local v0    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    return-void
.end method

.method private search(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 486
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->access$1100(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;Ljava/lang/String;)V

    .line 487
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 488
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 489
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchRequest:Lme/grishka/appkit/api/APIRequest;

    .line 491
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->errorView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 492
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->errorView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 494
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSearchOld;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/audio/AudioSearchOld;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/AudioListFragment$4;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$4;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;Landroid/app/Fragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchOld;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 509
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchRequest:Lme/grishka/appkit/api/APIRequest;

    .line 510
    return-void
.end method

.method private setIsSearching(Z)V
    .locals 1
    .param p1, "isSearching"    # Z

    .prologue
    .line 481
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->access$1000(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;Z)V

    .line 482
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 483
    return-void
.end method

.method private superUpdateList()V
    .locals 0

    .prologue
    .line 523
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->updateList()V

    .line 524
    return-void
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public doLoadData(II)V
    .locals 4
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 290
    const/4 v1, 0x1

    .line 291
    .local v1, "needStartLoading":Z
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    instance-of v2, v2, Lcom/vkontakte/android/api/audio/AudioGet;

    if-eqz v2, :cond_0

    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    check-cast v0, Lcom/vkontakte/android/api/audio/AudioGet;

    .line 293
    .local v0, "audioGet":Lcom/vkontakte/android/api/audio/AudioGet;
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGet;->isCanceled()Z

    move-result v1

    .line 295
    .end local v0    # "audioGet":Lcom/vkontakte/android/api/audio/AudioGet;
    :cond_0
    if-nez v1, :cond_1

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->refreshing:Z

    if-nez v2, :cond_1

    .line 314
    :goto_0
    return-void

    .line 298
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v2, :cond_2

    .line 299
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v2}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 301
    :cond_2
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioGet;

    iget v3, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGet;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/fragments/AudioListFragment$3;

    invoke-direct {v3, p0, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$3;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;Landroid/app/Fragment;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 313
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v0, :cond_0

    .line 231
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v0, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

    invoke-direct {v1, p0, v2, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;ILcom/vkontakte/android/fragments/AudioListFragment;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapterMainSection:Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/AudioListFragment$SectionHeaderAdapter;

    const v2, 0x7f0805eb

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/AudioListFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/AudioListFragment$SectionHeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;ILcom/vkontakte/android/fragments/AudioListFragment;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapterSearchSection:Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    return-object v0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 198
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->hasNavigationDrawer()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isAnimatingTransitionOut()Z
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x0

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 120
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 122
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "audio"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 125
    const v0, 0x7f080436

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->setEmptyText(I)V

    .line 127
    const v0, 0x7f08040f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->setTitle(I)V

    .line 129
    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper;

    new-instance v1, Lcom/vkontakte/android/fragments/AudioListFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$2;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    const/16 v2, 0x190

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 147
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 148
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->loadData()V

    .line 151
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 152
    const v0, 0x7f0301ff

    iput v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->spinnerViewResourceId:I

    .line 155
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->setHasOptionsMenu(Z)V

    .line 156
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 329
    return-void
.end method

.method public onConnected()V
    .locals 0

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 102
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 253
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 254
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/vkontakte/android/audio/AudioFacade;->bind(Landroid/content/Context;Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V

    .line 256
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 257
    .local v0, "filter":Landroid/content/IntentFilter;
    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_USER_AUDIO_REMOVED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 258
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 259
    return-void
.end method

.method protected onCreateFooterView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 671
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 245
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalidate menu, removing="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isRemoving()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 250
    :goto_0
    return-void

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 179
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 181
    .local v1, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/high16 v3, 0x2000000

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setScrollBarStyle(I)V

    .line 182
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 184
    new-instance v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;-><init>(Landroid/content/Context;)V

    .line 185
    .local v0, "pd":Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;
    invoke-virtual {v0, v4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->setUseIntrinsicPadding(Z)V

    .line 186
    invoke-virtual {v0, v4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->setShowTrack(Z)V

    .line 187
    return-object v1
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 1
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 318
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->preloadedData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 320
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 321
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 262
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->unbind(Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V

    .line 264
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 272
    :cond_0
    return-void

    .line 265
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 241
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDetach()V

    .line 242
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 356
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 357
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 282
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onPause()V

    .line 283
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 284
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 285
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 286
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 333
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 336
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 275
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onResume()V

    .line 276
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 277
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 278
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 279
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 340
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 341
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v0, :cond_1

    .line 342
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 346
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 347
    return-void
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 351
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->updateList()V

    .line 352
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 160
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 162
    iget v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 164
    :try_start_0
    iget v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->uid:I

    if-lez v1, :cond_2

    const/4 v1, 0x2

    :goto_0
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->setSelectedNavigationItem(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v3, v2, v3, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 171
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->isInContextOfAttachActivity()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 173
    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 174
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/AudioListFragment;->setRefreshEnabled(Z)V

    .line 176
    :cond_1
    return-void

    .line 164
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public playTrack(II)V
    .locals 4
    .param p1, "holderAdapterPosition"    # I
    .param p2, "section"    # I

    .prologue
    .line 203
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getCommonList()Ljava/util/List;

    move-result-object v0

    .line 204
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v1

    .line 205
    .local v1, "position":I
    if-eqz p2, :cond_0

    .line 206
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->dataContainer:Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getFirstList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    .line 208
    :cond_0
    if-nez p2, :cond_1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

    :goto_0
    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 211
    return-void

    .line 208
    :cond_1
    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerRefer;->search:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_0
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 361
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method

.method public setItemProgressBar(Landroid/widget/ProgressBar;)V
    .locals 2
    .param p1, "itemProgressBar"    # Landroid/widget/ProgressBar;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_1

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->itemProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 226
    :cond_1
    return-void
.end method

.method public updateList()V
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment;->updateListRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 520
    return-void
.end method
