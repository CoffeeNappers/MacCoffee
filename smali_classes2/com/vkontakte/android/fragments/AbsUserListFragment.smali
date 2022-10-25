.class public abstract Lcom/vkontakte/android/fragments/AbsUserListFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "AbsUserListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/AbsUserListFragment$UserListAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field private mActionListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mActionable:Z

.field private mOnClickListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 18
    invoke-static {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 19
    invoke-static {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mOnClickListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 25
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AbsUserListFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mOnClickListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AbsUserListFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AbsUserListFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/AbsUserListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AbsUserListFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">.GridAdapter<*>;"
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Lcom/vkontakte/android/fragments/AbsUserListFragment$UserListAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment$UserListAdapter;-><init>(Lcom/vkontakte/android/fragments/AbsUserListFragment;)V

    return-object v0
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 67
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v1

    .local v1, "listWidth":I
    if-lez v1, :cond_2

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    .line 69
    iget v2, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_1

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->isTablet:Z

    if-eqz v2, :cond_0

    const/high16 v2, 0x43200000    # 160.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 70
    .local v0, "columnWidth":I
    :goto_0
    div-int v2, v1, v0

    .line 72
    .end local v0    # "columnWidth":I
    .end local v1    # "listWidth":I
    :goto_1
    return v2

    .line 69
    .restart local v1    # "listWidth":I
    :cond_0
    const/high16 v2, 0x43870000    # 270.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0

    .line 72
    .end local v1    # "listWidth":I
    :cond_2
    const/4 v2, 0x1

    goto :goto_1
.end method

.method protected getHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mActionable:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->actionable(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->simple(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    goto :goto_0
.end method

.method public onActionClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 53
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 42
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "no_autoload"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 43
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->loaded:Z

    if-nez v1, :cond_2

    .line 44
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->loadData()V

    .line 49
    :cond_1
    :goto_0
    return-void

    .line 46
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->dataLoaded()V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 29
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onAttach(Landroid/app/Activity;)V

    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 31
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 32
    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    :cond_0
    return-void
.end method

.method public onItemClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 56
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 57
    return-void
.end method

.method protected final setActionable(Z)V
    .locals 0
    .param p1, "actionable"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/AbsUserListFragment;->mActionable:Z

    .line 77
    return-void
.end method
