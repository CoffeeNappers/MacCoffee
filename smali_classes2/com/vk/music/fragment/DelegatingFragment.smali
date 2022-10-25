.class public abstract Lcom/vk/music/fragment/DelegatingFragment;
.super Landroid/app/Fragment;
.source "DelegatingFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ActivityResulter;


# instance fields
.field private delegate:Lcom/vk/music/fragment/FragmentDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 30
    iget-object v1, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    if-nez v1, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/vk/music/fragment/DelegatingFragment;->createDelegate()Lcom/vk/music/fragment/FragmentDelegate;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    .line 34
    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v1, "state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .local v0, "state":Landroid/os/Bundle;
    if-eqz v0, :cond_1

    .line 35
    iget-object v1, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/FragmentDelegate;->restoreInstanceState(Landroid/os/Bundle;)V

    .line 37
    .end local v0    # "state":Landroid/os/Bundle;
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vk/music/fragment/DelegatingFragment;->setRetainInstance(Z)V

    .line 38
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v0}, Lcom/vk/music/fragment/FragmentDelegate;->createView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v0}, Lcom/vk/music/fragment/FragmentDelegate;->destroy()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    .line 75
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 76
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/vk/music/fragment/DelegatingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 67
    iget-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v0}, Lcom/vk/music/fragment/FragmentDelegate;->destroyView()V

    .line 68
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 69
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v0}, Lcom/vk/music/fragment/FragmentDelegate;->pause()V

    .line 61
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 62
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 54
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 55
    iget-object v0, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v0}, Lcom/vk/music/fragment/FragmentDelegate;->resume()V

    .line 56
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 23
    const-string/jumbo v0, "state"

    iget-object v1, p0, Lcom/vk/music/fragment/DelegatingFragment;->delegate:Lcom/vk/music/fragment/FragmentDelegate;

    invoke-virtual {v1}, Lcom/vk/music/fragment/FragmentDelegate;->saveInstanceState()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 24
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 25
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 49
    invoke-virtual {p0}, Lcom/vk/music/fragment/DelegatingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 50
    return-void
.end method
