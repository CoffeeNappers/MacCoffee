.class public Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "ServicesFragment.java"


# static fields
.field private static final descriptions:[I

.field private static final ids:[I

.field private static final options:[I

.field private static final titles:[I


# instance fields
.field private id:I

.field private info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

.field private radioGroups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/CompoundRadioGroup;",
            ">;"
        }
    .end annotation
.end field

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x7

    .line 41
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->titles:[I

    .line 42
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->options:[I

    .line 49
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->descriptions:[I

    .line 56
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->ids:[I

    return-void

    .line 41
    nop

    :array_0
    .array-data 4
        0x7f08077d
        0x7f0804b0
        0x7f08076e
        0x7f0800fa
        0x7f0801bd
        0x7f08011a
        0x7f080791
    .end array-data

    .line 42
    :array_1
    .array-data 4
        0x7f0c0012
        0x7f0c0010
        0x7f0c0010
        0x7f0c0010
        0x7f0c0010
        0x7f0c0010
        0x7f0c0010
    .end array-data

    .line 49
    :array_2
    .array-data 4
        0x7f0c0013
        0x7f0c000f
        0x7f0c0011
        0x7f0c000a
        0x7f0c000e
        0x7f0c000d
        0x7f0c0014
    .end array-data

    .line 56
    :array_3
    .array-data 4
        0x7f10003e
        0x7f10003f
        0x7f100040
        0x7f100041
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->radioGroups:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->updateInfo()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;

    .prologue
    .line 35
    iget v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->id:I

    return v0
.end method

.method private save()V
    .locals 8

    .prologue
    .line 177
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 178
    .local v3, "params":Landroid/os/Bundle;
    const/4 v5, 0x7

    new-array v2, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "wall"

    aput-object v6, v2, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "photos"

    aput-object v6, v2, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "video"

    aput-object v6, v2, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "audio"

    aput-object v6, v2, v5

    const/4 v5, 0x4

    const-string/jumbo v6, "docs"

    aput-object v6, v2, v5

    const/4 v5, 0x5

    const-string/jumbo v6, "topics"

    aput-object v6, v2, v5

    const/4 v5, 0x6

    const-string/jumbo v6, "wiki"

    aput-object v6, v2, v5

    .line 179
    .local v2, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v2

    if-ge v1, v5, :cond_0

    .line 180
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->radioGroups:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/CompoundRadioGroup;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->getCheckedId()I

    move-result v0

    .line 181
    .local v0, "checkedID":I
    const/4 v4, 0x0

    .line 182
    .local v4, "value":I
    packed-switch v0, :pswitch_data_0

    .line 196
    :goto_1
    aget-object v5, v2, v1

    invoke-virtual {v3, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 179
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 184
    :pswitch_0
    const/4 v4, 0x0

    .line 185
    goto :goto_1

    .line 187
    :pswitch_1
    const/4 v4, 0x1

    .line 188
    goto :goto_1

    .line 190
    :pswitch_2
    const/4 v4, 0x2

    .line 191
    goto :goto_1

    .line 193
    :pswitch_3
    const/4 v4, 0x3

    goto :goto_1

    .line 198
    .end local v0    # "checkedID":I
    .end local v4    # "value":I
    :cond_0
    new-instance v5, Lcom/vkontakte/android/api/groups/GroupsEdit;

    iget v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->id:I

    invoke-direct {v5, v6, v3}, Lcom/vkontakte/android/api/groups/GroupsEdit;-><init>(ILandroid/os/Bundle;)V

    new-instance v6, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$2;

    .line 199
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$2;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;Landroid/content/Context;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/groups/GroupsEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 210
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 211
    return-void

    .line 182
    :pswitch_data_0
    .packed-switch 0x7f10003e
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 147
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->content:Landroid/view/View;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 148
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 149
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 150
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 151
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 152
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 153
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 154
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 148
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 149
    goto :goto_1

    .line 156
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/high16 v6, 0x42000000    # 32.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 157
    .local v4, "pad":I
    :goto_2
    invoke-virtual {v5, v4, v7, v4, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 158
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 156
    goto :goto_2
.end method

.method private updateInfo()V
    .locals 5

    .prologue
    .line 170
    const/4 v2, 0x7

    new-array v1, v2, [I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->wall:I

    aput v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->photos:I

    aput v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->video:I

    aput v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->audio:I

    aput v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->docs:I

    aput v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->topics:I

    aput v3, v1, v2

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->info:Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    iget v3, v3, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->wiki:I

    aput v3, v1, v2

    .line 171
    .local v1, "values":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 172
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->radioGroups:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/CompoundRadioGroup;

    sget-object v3, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->ids:[I

    aget v4, v1, v0

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->setCheckedId(I)V

    .line 171
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 174
    :cond_0
    return-void
.end method


# virtual methods
.method public doLoadData()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsGetSettings;

    iget v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetSettings;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;Landroid/app/Fragment;)V

    .line 106
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetSettings;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 116
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 61
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 62
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->id:I

    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->type:I

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->loadData()V

    .line 65
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->setHasOptionsMenu(Z)V

    .line 66
    const v0, 0x7f0802f1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->setTitle(I)V

    .line 67
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 141
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 142
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->updateConfiguration()V

    .line 143
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->updateDecorator()V

    .line 144
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f0300c3

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 80
    .local v0, "content":Landroid/view/View;
    const v9, 0x7f10000e

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 81
    .local v1, "cv":Landroid/widget/LinearLayout;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v9, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->options:[I

    array-length v9, v9

    if-ge v2, v9, :cond_2

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f03009f

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    .line 83
    .local v8, "wrap":Landroid/view/View;
    const v9, 0x7f100299

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 84
    .local v5, "radioGroup":Landroid/view/ViewGroup;
    const v9, 0x7f100298

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    sget-object v10, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->titles:[I

    aget v10, v10, v2

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->options:[I

    aget v10, v10, v2

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v7

    .line 86
    .local v7, "titles":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->descriptions:[I

    aget v10, v10, v2

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    .line 87
    .local v6, "subtitles":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    array-length v9, v7

    if-ge v4, v9, :cond_1

    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f0301e8

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 89
    .local v3, "item":Landroid/view/View;
    const v9, 0x7f100128

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    aget-object v10, v7, v4

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const v9, 0x7f1001cc

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    aget-object v10, v6, v4

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    aget-object v9, v6, v4

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_0

    .line 92
    const v9, 0x7f1001cc

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 94
    :cond_0
    sget-object v9, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->ids:[I

    aget v9, v9, v4

    invoke-virtual {v3, v9}, Landroid/view/View;->setId(I)V

    .line 95
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 87
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 97
    .end local v3    # "item":Landroid/view/View;
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->radioGroups:Ljava/util/ArrayList;

    check-cast v5, Lcom/vkontakte/android/ui/CompoundRadioGroup;

    .end local v5    # "radioGroup":Landroid/view/ViewGroup;
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 81
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 100
    .end local v4    # "j":I
    .end local v6    # "subtitles":[Ljava/lang/String;
    .end local v7    # "titles":[Ljava/lang/String;
    .end local v8    # "wrap":Landroid/view/View;
    :cond_2
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 120
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->loaded:Z

    if-nez v1, :cond_0

    .line 126
    :goto_0
    return-void

    .line 123
    :cond_0
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 124
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 125
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 71
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 72
    .local v0, "v":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->updateConfiguration()V

    .line 73
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->updateDecorator()V

    .line 74
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->save()V

    .line 131
    const/4 v0, 0x1

    return v0
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 216
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 137
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 162
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_split"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ServicesFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 166
    :cond_0
    return-void
.end method
