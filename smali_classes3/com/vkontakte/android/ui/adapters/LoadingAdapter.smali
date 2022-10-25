.class public abstract Lcom/vkontakte/android/ui/adapters/LoadingAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "LoadingAdapter.java"

# interfaces
.implements Lme/grishka/appkit/utils/Preloader$Callback;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Listener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<H:",
        "Ljava/lang/Object;",
        "T:",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">",
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<TT;>;",
        "Lme/grishka/appkit/utils/Preloader$Callback",
        "<TH;>;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Listener;"
    }
.end annotation


# instance fields
.field protected dataLoading:Z

.field protected displayItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TH;>;"
        }
    .end annotation
.end field

.field protected list:Lme/grishka/appkit/views/UsableRecyclerView;

.field protected preloader:Lme/grishka/appkit/utils/Preloader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lme/grishka/appkit/utils/Preloader",
            "<TH;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;I)V
    .locals 2
    .param p2, "list"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p3, "countForLoad"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TH;>;",
            "Lme/grishka/appkit/views/UsableRecyclerView;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    .local p1, "initialList":Ljava/util/List;, "Ljava/util/List<TH;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->displayItems:Ljava/util/ArrayList;

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->dataLoading:Z

    .line 19
    new-instance v0, Lme/grishka/appkit/utils/Preloader;

    invoke-direct {v0, p0, p3}, Lme/grishka/appkit/utils/Preloader;-><init>(Lme/grishka/appkit/utils/Preloader$Callback;I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    .line 20
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lme/grishka/appkit/utils/Preloader;->onDataLoaded(Ljava/util/List;Z)V

    .line 21
    iput-object p2, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 22
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 26
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public isDataLoading()Z
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->dataLoading:Z

    return v0
.end method

.method public isRefreshing()Z
    .locals 1

    .prologue
    .line 46
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public onClearItems()V
    .locals 1

    .prologue
    .line 36
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 37
    return-void
.end method

.method public onScrollStarted()V
    .locals 0

    .prologue
    .line 56
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    return-void
.end method

.method public onScrolledToLastItem()V
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->onScrolledToLastItem()V

    .line 52
    return-void
.end method

.method public updateList()V
    .locals 0

    .prologue
    .line 31
    .local p0, "this":Lcom/vkontakte/android/ui/adapters/LoadingAdapter;, "Lcom/vkontakte/android/ui/adapters/LoadingAdapter<TH;TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;->notifyDataSetChanged()V

    .line 32
    return-void
.end method
