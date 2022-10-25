.class Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;
.super Ljava/lang/Object;
.source "AudioListFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DataContainer"
.end annotation


# instance fields
.field private currentSearchQuery:Ljava/lang/String;

.field private final data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private isSearching:Z

.field private localSearchResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private serverSearchResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 1

    .prologue
    .line 543
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 588
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching:Z

    .line 589
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    .line 590
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->localSearchResult:Ljava/util/List;

    .line 591
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->serverSearchResult:Ljava/util/List;

    .line 631
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->data:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;Lcom/vkontakte/android/fragments/AudioListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/AudioListFragment$1;

    .prologue
    .line 543
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;
    .param p1, "x1"    # Z

    .prologue
    .line 543
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->setIsSearching(Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 543
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->setCurrentSearchQuery(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    .prologue
    .line 543
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching()Z

    move-result v0

    return v0
.end method

.method private isSearching()Z
    .locals 1

    .prologue
    .line 606
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching:Z

    return v0
.end method

.method private setCurrentSearchQuery(Ljava/lang/String;)V
    .locals 1
    .param p1, "currentSearchQuery"    # Ljava/lang/String;

    .prologue
    .line 594
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 595
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    .line 596
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->localSearchResult:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 597
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->serverSearchResult:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 599
    :cond_0
    return-void
.end method

.method private setIsSearching(Z)V
    .locals 0
    .param p1, "isSearching"    # Z

    .prologue
    .line 602
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching:Z

    .line 603
    return-void
.end method


# virtual methods
.method getCommonList()Ljava/util/List;
    .locals 5
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
    .line 578
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getFirstList()Ljava/util/List;

    move-result-object v0

    .line 579
    .local v0, "firstList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getSecondList()Ljava/util/List;

    move-result-object v1

    .line 580
    .local v1, "secondList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 581
    .local v2, "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 582
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 583
    return-object v2
.end method

.method getCurrentTrackList()Ljava/util/List;
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
    .line 634
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->data:Ljava/util/List;

    return-object v0
.end method

.method getFirstList()Ljava/util/List;
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
    .line 562
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 563
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getLocalSearchResult()Ljava/util/List;

    move-result-object v0

    .line 565
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getCurrentTrackList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method getLocalSearchResult()Ljava/util/List;
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
    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->localSearchResult:Ljava/util/List;

    return-object v0
.end method

.method getSecondList()Ljava/util/List;
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
    .line 570
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->isSearching()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 571
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getServerSearchResult()Ljava/util/List;

    move-result-object v0

    .line 573
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method getServerSearchResult()Ljava/util/List;
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
    .line 626
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->serverSearchResult:Ljava/util/List;

    return-object v0
.end method

.method putLocalSearchResult(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 610
    .local p1, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 611
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    .end local p1    # "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->localSearchResult:Ljava/util/List;

    .line 613
    :cond_1
    return-void
.end method

.method putSearchResult(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 616
    .local p1, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->currentSearchQuery:Ljava/lang/String;

    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 617
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    .end local p1    # "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->serverSearchResult:Ljava/util/List;

    .line 619
    :cond_1
    return-void
.end method

.method putTracksList(Ljava/util/List;)V
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
    .line 638
    .local p1, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 639
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 640
    return-void
.end method

.method public remove(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 643
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 644
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 548
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1900(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->isComputingLayout()Z

    move-result v1

    if-nez v1, :cond_2

    .line 549
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getCommonList()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/AudioListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 550
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$2000(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    .line 559
    :cond_1
    :goto_0
    return-void

    .line 551
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->isResumed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 552
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 553
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 555
    :catch_0
    move-exception v0

    .line 556
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 557
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
