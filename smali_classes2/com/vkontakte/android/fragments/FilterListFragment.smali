.class public abstract Lcom/vkontakte/android/fragments/FilterListFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "FilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field private groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

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

.field final mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

.field private toast:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/Toast;",
            ">;"
        }
    .end annotation
.end field

.field private users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
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
    .line 36
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>(I)V

    .line 27
    invoke-static {p0}, Lcom/vkontakte/android/fragments/FilterListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 28
    invoke-static {p0}, Lcom/vkontakte/android/fragments/FilterListFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mOnClickListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/SectionSegmenter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    .line 37
    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/FilterListFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/FilterListFragment;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/FilterListFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/FilterListFragment;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/FilterListFragment;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mOnClickListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/FilterListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/FilterListFragment;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "textRes"    # I

    .prologue
    .line 125
    if-nez p1, :cond_1

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 128
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->toast:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_3

    const/4 v1, 0x0

    .line 129
    .local v1, "toast":Landroid/widget/Toast;
    :goto_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 130
    .local v0, "activity":Landroid/app/Activity;
    if-nez v1, :cond_4

    if-eqz v0, :cond_4

    .line 131
    const/4 v2, 0x1

    invoke-static {v0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 135
    :cond_2
    :goto_2
    if-eqz v1, :cond_0

    .line 136
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->toast:Ljava/lang/ref/WeakReference;

    .line 137
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 128
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "toast":Landroid/widget/Toast;
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->toast:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/Toast;

    move-object v1, v2

    goto :goto_1

    .line 132
    .restart local v0    # "activity":Landroid/app/Activity;
    .restart local v1    # "toast":Landroid/widget/Toast;
    :cond_4
    if-eqz v1, :cond_2

    .line 133
    invoke-virtual {v1, p1}, Landroid/widget/Toast;->setText(I)V

    goto :goto_2
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/UserProfile;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/FilterListFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/FilterListFragment;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getUsersGroupRequest()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/FilterListFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/FilterListFragment$1;-><init>(Lcom/vkontakte/android/fragments/FilterListFragment;Landroid/app/Fragment;)V

    .line 74
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 86
    return-void
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 59
    iget-object v2, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 60
    .local v1, "listWidth":I
    iget v2, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_0

    const/high16 v2, 0x43200000    # 160.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 61
    .local v0, "columnWidth":I
    :goto_0
    div-int v2, v1, v0

    return v2

    .end local v0    # "columnWidth":I
    :cond_0
    move v0, v1

    .line 60
    goto :goto_0
.end method

.method protected abstract getGroupActionSuccessText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method protected getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    return-object v0
.end method

.method protected abstract getUserActionSuccessText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method protected abstract getUsersGroupRequest()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
.end method

.method protected abstract onActionClick(Lcom/vkontakte/android/UserProfile;)V
.end method

.method protected onActionSuccess(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 103
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v1, :cond_2

    .line 104
    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 105
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v3, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, v3, :cond_0

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 110
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getUserActionSuccessText()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->showToast(I)V

    .line 120
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->rebuildSegmenter()V

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->updateList()V

    .line 122
    return-void

    .line 112
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 113
    .restart local v0    # "p":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v3, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, v3, :cond_3

    .line 114
    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 118
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getGroupActionSuccessText()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->showToast(I)V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onAttach(Landroid/app/Activity;)V

    .line 67
    const v0, 0x7f080635

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/FilterListFragment;->setTitle(I)V

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->doLoadData()V

    .line 69
    return-void
.end method

.method public onItemClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 99
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/FilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 100
    return-void
.end method

.method rebuildSegmenter()V
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->clear()V

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->users:Ljava/util/ArrayList;

    const v2, 0x7f080497

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/FilterListFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->mSegmenter:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/FilterListFragment;->groups:Ljava/util/ArrayList;

    const v2, 0x7f0802fd

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/FilterListFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    .line 96
    :cond_1
    return-void
.end method
