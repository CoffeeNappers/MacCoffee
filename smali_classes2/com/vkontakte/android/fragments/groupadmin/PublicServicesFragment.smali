.class public Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "PublicServicesFragment.java"


# static fields
.field private static final IDS:[I


# instance fields
.field private fields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private id:I

.field private info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

.field private type:I

.field private view:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->IDS:[I

    return-void

    :array_0
    .array-data 4
        0x7f1002f1
        0x7f1002f2
        0x7f1002f3
        0x7f1002f4
        0x7f1002f5
        0x7f1002f6
        0x7f1002f7
        0x7f1002f8
        0x7f1002f9
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 34
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 40
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "wall"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "links"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "photos"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "video"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "audio"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "topics"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "events"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "places"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "contacts"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->fields:Ljava/util/List;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->updateInfo()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    .prologue
    .line 34
    iget v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->id:I

    return v0
.end method

.method private save()V
    .locals 6

    .prologue
    .line 145
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 146
    .local v2, "params":Landroid/os/Bundle;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->fields:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 147
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->view:Landroid/view/View;

    sget-object v4, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->IDS:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 148
    .local v0, "check":Landroid/widget/CheckBox;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->fields:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 146
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 150
    .end local v0    # "check":Landroid/widget/CheckBox;
    :cond_1
    new-instance v3, Lcom/vkontakte/android/api/groups/GroupsEdit;

    iget v4, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->id:I

    invoke-direct {v3, v4, v2}, Lcom/vkontakte/android/api/groups/GroupsEdit;-><init>(ILandroid/os/Bundle;)V

    new-instance v4, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;-><init>(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/groups/GroupsEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 161
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 163
    return-void
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 112
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->content:Landroid/view/View;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 113
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 114
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 115
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 116
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 118
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 119
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 114
    goto :goto_1

    .line 121
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/high16 v6, 0x42000000    # 32.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 122
    .local v4, "pad":I
    :goto_2
    invoke-virtual {v5, v4, v7, v4, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 123
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 121
    goto :goto_2
.end method

.method private updateInfo()V
    .locals 7

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 134
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->view:Landroid/view/View;

    if-nez v3, :cond_1

    .line 142
    :cond_0
    return-void

    .line 137
    :cond_1
    const/16 v3, 0x9

    new-array v2, v3, [Z

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->wall:I

    if-ne v3, v4, :cond_2

    move v3, v4

    :goto_0
    aput-boolean v3, v2, v5

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->links:I

    if-ne v3, v4, :cond_3

    move v3, v4

    :goto_1
    aput-boolean v3, v2, v4

    const/4 v6, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->photos:I

    if-ne v3, v4, :cond_4

    move v3, v4

    :goto_2
    aput-boolean v3, v2, v6

    const/4 v6, 0x3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->video:I

    if-ne v3, v4, :cond_5

    move v3, v4

    :goto_3
    aput-boolean v3, v2, v6

    const/4 v6, 0x4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->audio:I

    if-ne v3, v4, :cond_6

    move v3, v4

    :goto_4
    aput-boolean v3, v2, v6

    const/4 v6, 0x5

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->topics:I

    if-ne v3, v4, :cond_7

    move v3, v4

    :goto_5
    aput-boolean v3, v2, v6

    const/4 v6, 0x6

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->events:I

    if-ne v3, v4, :cond_8

    move v3, v4

    :goto_6
    aput-boolean v3, v2, v6

    const/4 v6, 0x7

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->places:I

    if-ne v3, v4, :cond_9

    move v3, v4

    :goto_7
    aput-boolean v3, v2, v6

    const/16 v3, 0x8

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v6, v6, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->contacts:I

    if-ne v6, v4, :cond_a

    :goto_8
    aput-boolean v4, v2, v3

    .line 138
    .local v2, "values":[Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->fields:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 139
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->view:Landroid/view/View;

    sget-object v4, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->IDS:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 140
    .local v0, "check":Landroid/widget/CheckBox;
    aget-boolean v3, v2, v1

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .end local v0    # "check":Landroid/widget/CheckBox;
    .end local v1    # "i":I
    .end local v2    # "values":[Z
    :cond_2
    move v3, v5

    .line 137
    goto :goto_0

    :cond_3
    move v3, v5

    goto :goto_1

    :cond_4
    move v3, v5

    goto :goto_2

    :cond_5
    move v3, v5

    goto :goto_3

    :cond_6
    move v3, v5

    goto :goto_4

    :cond_7
    move v3, v5

    goto :goto_5

    :cond_8
    move v3, v5

    goto :goto_6

    :cond_9
    move v3, v5

    goto :goto_7

    :cond_a
    move v4, v5

    goto :goto_8
.end method


# virtual methods
.method public doLoadData()V
    .locals 2

    .prologue
    .line 86
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsGetSettings;

    iget v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetSettings;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Landroid/app/Fragment;)V

    .line 87
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetSettings;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 97
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 45
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->id:I

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->type:I

    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->loadData()V

    .line 49
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->setHasOptionsMenu(Z)V

    .line 50
    const v0, 0x7f0802f1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->setTitle(I)V

    .line 51
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 106
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 107
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->updateConfiguration()V

    .line 108
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->updateDecorator()V

    .line 109
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0300c4

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->view:Landroid/view/View;

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 64
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->loaded:Z

    if-nez v1, :cond_0

    .line 70
    :goto_0
    return-void

    .line 67
    :cond_0
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 68
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 69
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->content:Landroid/view/View;

    const/high16 v2, 0x2000000

    invoke-virtual {v1, v2}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 57
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->updateConfiguration()V

    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->updateDecorator()V

    .line 59
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->save()V

    .line 75
    const/4 v0, 0x1

    return v0
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 168
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 102
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 127
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_split"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 131
    :cond_0
    return-void
.end method
