.class public Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;
.super Lme/grishka/appkit/fragments/ToolbarFragment;
.source "BannedUserSettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    }
.end annotation


# static fields
.field private static final BLOCK_DURATIONS:[I


# instance fields
.field private commentEdit:Landroid/widget/EditText;

.field private durationAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;",
            ">;"
        }
    .end annotation
.end field

.field private durationSpinner:Landroid/widget/Spinner;

.field private profile:Lcom/vkontakte/android/UserProfile;

.field private reasonAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private reasonSpinner:Landroid/widget/Spinner;

.field private showCommentCheck:Landroid/widget/CheckBox;

.field private view:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->BLOCK_DURATIONS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1e13380
        0x28de80
        0x93a80
        0x15180
        0xe10
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ToolbarFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->unban()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    return-object v0
.end method

.method public static open(Landroid/os/Bundle;Landroid/app/Activity;)V
    .locals 4
    .param p0, "args"    # Landroid/os/Bundle;
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 221
    new-instance v0, Lcom/vkontakte/android/navigation/Navigator;

    const-class v1, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    new-instance v2, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v3, 0x11

    .line 223
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 225
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 226
    return-void
.end method

.method private save()V
    .locals 15

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;

    iget v4, v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->time:I

    .line 230
    .local v4, "endDate":I
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v5

    .line 231
    .local v5, "reason":I
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->commentEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 232
    .local v6, "comment":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->showCommentCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    .line 233
    .local v7, "showComment":Z
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsBanUser;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/groups/GroupsBanUser;-><init>(IIZIILjava/lang/String;Z)V

    new-instance v8, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;

    .line 234
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    move-object v9, p0

    move v11, v4

    move-object v12, v6

    move v13, v5

    move v14, v7

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;Landroid/content/Context;ILjava/lang/String;IZ)V

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/api/groups/GroupsBanUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 265
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 267
    return-void
.end method

.method private unban()V
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 270
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsBanUser;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v6, 0x0

    move v4, v3

    move v5, v3

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/groups/GroupsBanUser;-><init>(IIZIILjava/lang/String;Z)V

    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$4;

    .line 271
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$4;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsBanUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 281
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 282
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 283
    return-void
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 190
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 191
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 192
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 193
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 194
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 195
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 196
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 197
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 191
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 192
    goto :goto_1

    .line 199
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/high16 v6, 0x42000000    # 32.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 200
    .local v4, "pad":I
    :goto_2
    invoke-virtual {v5, v4, v7, v4, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 201
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 199
    goto :goto_2
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 67
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "profile"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-class v1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 71
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->setHasOptionsMenu(Z)V

    .line 73
    const v0, 0x7f0802b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->setTitle(I)V

    .line 74
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 184
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 185
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->updateConfiguration()V

    .line 186
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->updateDecorator()V

    .line 187
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v11, 0x7f0802af

    const v9, 0x7f030068

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x0

    .line 91
    const v5, 0x7f0300c5

    invoke-virtual {p1, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    .line 93
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fa

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationSpinner:Landroid/widget/Spinner;

    .line 94
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fb

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonSpinner:Landroid/widget/Spinner;

    .line 95
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->commentEdit:Landroid/widget/EditText;

    .line 96
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fd

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->showCommentCheck:Landroid/widget/CheckBox;

    .line 98
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const v6, 0x7f0c000c

    invoke-static {v5, v6, v9}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonAdapter:Landroid/widget/ArrayAdapter;

    .line 99
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonAdapter:Landroid/widget/ArrayAdapter;

    const v6, 0x1090009

    invoke-virtual {v5, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 100
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 102
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "ban_admin"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 104
    .local v0, "admin":Lcom/vkontakte/android/UserProfile;
    new-instance v5, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, p0, v6, v9}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationAdapter:Landroid/widget/ArrayAdapter;

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0c000b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 122
    .local v1, "durations":[Ljava/lang/String;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "ban_end_date"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 123
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "ban_end_date"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 124
    .local v2, "endDate":I
    if-lez v2, :cond_0

    .line 125
    new-instance v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;

    invoke-direct {v4, v7}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;)V

    .line 126
    .local v4, "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v11, v5}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->title:Ljava/lang/String;

    .line 127
    iput v2, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->time:I

    .line 128
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v4}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 131
    .end local v2    # "endDate":I
    .end local v4    # "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    :cond_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v1

    if-ge v3, v5, :cond_2

    .line 132
    new-instance v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;

    invoke-direct {v4, v7}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;)V

    .line 133
    .restart local v4    # "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    aget-object v5, v1, v3

    iput-object v5, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->title:Ljava/lang/String;

    .line 134
    if-nez v3, :cond_1

    .line 135
    const v5, 0x7f0802b0

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->subtitle:Ljava/lang/String;

    .line 140
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v4}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 131
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 137
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v5

    sget-object v6, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->BLOCK_DURATIONS:[I

    aget v6, v6, v3

    add-int/2addr v5, v6

    iput v5, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->time:I

    .line 138
    new-array v5, v8, [Ljava/lang/Object;

    iget v6, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->time:I

    invoke-static {v6}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {p0, v11, v5}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->subtitle:Ljava/lang/String;

    goto :goto_1

    .line 143
    .end local v4    # "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->durationAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 145
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002ba

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    if-eqz v0, :cond_5

    .line 147
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1001cc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v6, v6, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v6, :cond_3

    const v6, 0x7f0802a5

    :goto_2
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v6, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v6, :cond_4

    const v6, 0x7f0800bf

    :goto_3
    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-virtual {p0, v6, v8}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "ban_date"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->reasonAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v6}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    iget-object v7, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "ban_reason"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v10, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 149
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->commentEdit:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "ban_comment"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 150
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->showCommentCheck:Landroid/widget/CheckBox;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "ban_comment_visible"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 156
    :goto_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1001e8

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 158
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fe

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$2;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$2;-><init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    return-object v5

    .line 147
    :cond_3
    const v6, 0x7f0802a6

    goto/16 :goto_2

    :cond_4
    const v6, 0x7f0800c0

    goto/16 :goto_3

    .line 152
    :cond_5
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1001cc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "is_group_member"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "is_group_member"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    :cond_6
    const v6, 0x7f0802ab

    :goto_5
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 153
    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->view:Landroid/view/View;

    const v6, 0x7f1002fe

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    .line 152
    :cond_7
    const v6, 0x7f0802ac

    goto :goto_5
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 78
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 79
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 80
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 81
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 213
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/ToolbarFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 214
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->content:Landroid/view/View;

    const/high16 v2, 0x2000000

    invoke-virtual {v1, v2}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 215
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->updateConfiguration()V

    .line 216
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->updateDecorator()V

    .line 217
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->save()V

    .line 86
    const/4 v0, 0x1

    return v0
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 180
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 205
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_split"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 209
    :cond_0
    return-void
.end method
