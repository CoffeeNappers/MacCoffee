.class public Lcom/vkontakte/android/fragments/VKFragment;
.super Landroid/app/DialogFragment;
.source "VKFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/FABHelper$OnOptionItemSelectedListener;


# instance fields
.field private final compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

.field protected isTablet:Z

.field private subtitle:Ljava/lang/CharSequence;

.field private title:Ljava/lang/CharSequence;

.field private viewCreated:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 22
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->isTablet:Z

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    .line 39
    invoke-static {p1}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->isTablet:Z

    .line 40
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 45
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->isTablet:Z

    .line 46
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 74
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroy()V

    .line 75
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 32
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/VKFragment;->setUserVisibleHint(Z)V

    .line 34
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 50
    invoke-super {p0, p1, p2}, Landroid/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 51
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/VKFragment;->viewCreated:Z

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_dialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/VKFragment;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_dialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 58
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 59
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->getNavigationMode()I

    move-result v0

    if-eqz v0, :cond_3

    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/ui/StubListAdapter;->getInstance()Lcom/vkontakte/android/ui/StubListAdapter;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 63
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 65
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->subtitle:Ljava/lang/CharSequence;

    if-eqz v0, :cond_5

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/VKFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 69
    :cond_5
    return-void
.end method

.method public registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 105
    return-object p1
.end method

.method protected setSubtitle(I)V
    .locals 1
    .param p1, "res"    # I

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/VKFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/VKFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 101
    return-void
.end method

.method protected setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKFragment;->subtitle:Ljava/lang/CharSequence;

    .line 94
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->viewCreated:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 95
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 97
    :cond_0
    return-void
.end method

.method protected setTitle(I)V
    .locals 1
    .param p1, "res"    # I

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/VKFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/VKFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 90
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKFragment;->title:Ljava/lang/CharSequence;

    .line 79
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/VKFragment;->viewCreated:Z

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_dialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 86
    :cond_1
    return-void
.end method
