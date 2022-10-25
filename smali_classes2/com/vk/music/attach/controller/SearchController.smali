.class public abstract Lcom/vk/music/attach/controller/SearchController;
.super Lcom/vk/music/attach/controller/Controller;
.source "SearchController.java"


# static fields
.field private static final SEARCH_DELAY:J = 0x190L


# instance fields
.field private handler:Landroid/os/Handler;

.field private searchCommand:Ljava/lang/Runnable;

.field private searchTextWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/vk/music/attach/controller/Controller;-><init>()V

    .line 18
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->handler:Landroid/os/Handler;

    .line 19
    invoke-static {p0}, Lcom/vk/music/attach/controller/SearchController$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/controller/SearchController;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->searchCommand:Ljava/lang/Runnable;

    .line 20
    new-instance v0, Lcom/vk/music/attach/controller/SearchController$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/SearchController$1;-><init>(Lcom/vk/music/attach/controller/SearchController;)V

    iput-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->searchTextWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/music/attach/controller/SearchController;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/attach/controller/SearchController;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->searchCommand:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/music/attach/controller/SearchController;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/attach/controller/SearchController;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->handler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method protected final getSearchText()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/SearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 47
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onPause()V

    .line 48
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/SearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/SearchController;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 49
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 41
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onResume()V

    .line 42
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/SearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/SearchController;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 43
    return-void
.end method

.method protected abstract onStartSearch()V
.end method

.method protected abstract onStopSearch()V
.end method

.method protected onViewDetached()V
    .locals 2

    .prologue
    .line 53
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onViewDetached()V

    .line 54
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/music/attach/controller/SearchController;->searchCommand:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 55
    return-void
.end method

.method protected final setSearchText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/SearchController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 64
    return-void
.end method
