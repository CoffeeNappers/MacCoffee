.class public Lcom/vkontakte/android/fragments/VKAlertFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "VKAlertFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected action()V
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 61
    return-void
.end method

.method protected init(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 40
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 41
    const-string/jumbo v2, "Builder"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    .line 42
    .local v1, "builder":Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    if-eqz v1, :cond_0

    .line 43
    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->titleId:Ljava/lang/String;

    .line 44
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->message:Ljava/lang/String;

    .line 45
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/VKAlertFragment;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->positiveButtonTitleId:Ljava/lang/String;

    new-instance v4, Lcom/vkontakte/android/fragments/VKAlertFragment$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/VKAlertFragment$1;-><init>(Lcom/vkontakte/android/fragments/VKAlertFragment;)V

    .line 47
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 57
    .end local v1    # "builder":Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;
    :goto_0
    return-void

    .line 56
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$init$0(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "bundle"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 29
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/AppKitFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/VKAlertFragment;->init(Landroid/view/View;)V

    .line 36
    return-void
.end method
