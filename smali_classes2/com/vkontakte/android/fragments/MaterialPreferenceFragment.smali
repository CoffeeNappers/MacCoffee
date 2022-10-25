.class public Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
.super Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;
.source "MaterialPreferenceFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$CenterLayoutManager;,
        Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;
    }
.end annotation


# static fields
.field public static final HIGHLIGHT_PREFERENCE_KEY:Ljava/lang/String; = "pref_to_highlight"


# instance fields
.field private decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

.field private highlighted:Z

.field protected isTablet:Z

.field private positionToHighlight:I

.field private preferenceKeyToHighlight:Ljava/lang/String;

.field protected scrW:I

.field protected wrapperAdapter:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->wrapperAdapter:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->preferenceKeyToHighlight:Ljava/lang/String;

    .line 44
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->positionToHighlight:I

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->highlighted:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 34
    iget v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->positionToHighlight:I

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
    .param p1, "x1"    # I

    .prologue
    .line 34
    iput p1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->positionToHighlight:I

    return p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->preferenceKeyToHighlight:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->highlighted:Z

    return v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->highlighted:Z

    return p1
.end method

.method private updateDecorator()V
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 104
    :cond_0
    return-void
.end method


# virtual methods
.method protected bindPreferences()V
    .locals 0

    .prologue
    .line 80
    invoke-super {p0}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->bindPreferences()V

    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->updateDecorator()V

    .line 82
    return-void
.end method

.method synthetic lambda$onCreateRecyclerView$0(I)Z
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 126
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->wrapperAdapter:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 127
    .local v0, "item":Landroid/support/v7/preference/Preference;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->wrapperAdapter:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 128
    .local v1, "itemNext":Landroid/support/v7/preference/Preference;
    instance-of v2, v0, Landroid/support/v7/preference/PreferenceCategory;

    if-nez v2, :cond_0

    instance-of v2, v1, Landroid/support/v7/preference/PreferenceCategory;

    if-nez v2, :cond_0

    instance-of v2, v1, Lcom/vkontakte/android/ui/MaterialSectionDividerPreference;

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onAttach(Landroid/app/Activity;)V

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->updateConfiguration()V

    .line 51
    return-void
.end method

.method protected onBindPreferences()V
    .locals 4

    .prologue
    .line 87
    invoke-super {p0}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onBindPreferences()V

    .line 89
    iget v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->positionToHighlight:I

    if-ltz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;-><init>(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 97
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 74
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->updateConfiguration()V

    .line 75
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->updateDecorator()V

    .line 76
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "pref_to_highlight"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->preferenceKeyToHighlight:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->preferenceKeyToHighlight:Ljava/lang/String;

    .line 62
    return-void
.end method

.method protected onCreateAdapter(Landroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 2
    .param p1, "preferenceScreen"    # Landroid/support/v7/preference/PreferenceScreen;

    .prologue
    .line 202
    new-instance v0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;

    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onCreateAdapter(Landroid/support/v7/preference/PreferenceScreen;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->wrapperAdapter:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;

    return-object v0
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 113
    iget v5, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v5, v6, :cond_0

    move v1, v3

    .line 114
    .local v1, "isTabletDecorator":Z
    :goto_0
    new-instance v0, Lcom/vkontakte/android/ui/CardItemDecorator;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    if-nez v1, :cond_1

    :goto_1
    invoke-direct {v0, v5, v3}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    .line 115
    .local v0, "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3, v5, v6, v4}, Lcom/vkontakte/android/ui/CardItemDecorator;->setPadding(IIII)V

    .line 116
    if-eqz v1, :cond_2

    const/16 v3, 0x10

    iget v5, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->scrW:I

    add-int/lit16 v5, v5, -0x39c

    div-int/lit8 v5, v5, 0x2

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 117
    .local v2, "pad":I
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v2, v4, v2, v4}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 118
    return-object v0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    .end local v1    # "isTabletDecorator":Z
    .end local v2    # "pad":I
    :cond_0
    move v1, v4

    .line 113
    goto :goto_0

    .restart local v1    # "isTabletDecorator":Z
    :cond_1
    move v3, v4

    .line 114
    goto :goto_1

    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    :cond_2
    move v2, v4

    .line 116
    goto :goto_2
.end method

.method public onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .locals 2

    .prologue
    .line 143
    new-instance v0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$CenterLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$CenterLayoutManager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0
    .param p1, "bundle"    # Landroid/os/Bundle;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 139
    return-void
.end method

.method public onCreateRecyclerView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/support/v7/widget/RecyclerView;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 123
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onCreateRecyclerView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    .line 124
    .local v1, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v3, 0x26000000

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v0, v2, v3}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 125
    .local v0, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    invoke-static {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    move-result-object v2

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 132
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 133
    return-object v1
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 108
    invoke-super {p0}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onDestroyView()V

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    .line 110
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/preference/PreferenceFragmentCompat;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setScrollBarStyle(I)V

    .line 68
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->updateDecorator()V

    .line 69
    return-void
.end method

.method protected updateConfiguration()V
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->scrW:I

    .line 55
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->isTablet:Z

    .line 56
    return-void
.end method
