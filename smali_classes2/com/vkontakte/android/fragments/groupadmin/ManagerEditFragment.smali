.class public Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;
.super Lme/grishka/appkit/fragments/ToolbarFragment;
.source "ManagerEditFragment.java"


# instance fields
.field private profile:Lcom/vkontakte/android/UserProfile;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ToolbarFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->remove()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    return-object v0
.end method

.method public static open(Landroid/os/Bundle;Landroid/app/Activity;)V
    .locals 4
    .param p0, "args"    # Landroid/os/Bundle;
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 188
    new-instance v0, Lcom/vkontakte/android/navigation/Navigator;

    const-class v1, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    new-instance v2, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v3, 0x11

    .line 190
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 192
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 193
    return-void
.end method

.method private remove()V
    .locals 7

    .prologue
    .line 256
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 257
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0802ea

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<b>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    const/4 v6, 0x3

    .line 258
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</b>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    new-instance v2, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V

    .line 259
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 281
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 282
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 283
    return-void
.end method

.method private save()V
    .locals 15

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v1, 0x7f1002e3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/ui/CompoundRadioGroup;

    .line 205
    .local v13, "radoigroup":Lcom/vkontakte/android/ui/CompoundRadioGroup;
    invoke-virtual {v13}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->getCheckedId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 219
    const/4 v3, 0x0

    .line 220
    .local v3, "role":Ljava/lang/String;
    const v0, 0x7f0802d9

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 223
    .local v9, "displayableRole":Ljava/lang/String;
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v1, 0x7f100307

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/CheckBox;

    .line 224
    .local v14, "showContact":Landroid/widget/CheckBox;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v1, 0x7f100309

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, "contactTitle":Ljava/lang/String;
    invoke-virtual {v14}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    .line 226
    .local v4, "show":Z
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsEditManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/groups/GroupsEditManager;-><init>(IILjava/lang/String;ZLjava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;

    .line 227
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    move-object v7, p0

    move-object v10, v3

    move v11, v4

    move-object v12, v5

    invoke-direct/range {v6 .. v12}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/api/groups/GroupsEditManager;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 251
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 252
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 253
    return-void

    .line 207
    .end local v3    # "role":Ljava/lang/String;
    .end local v4    # "show":Z
    .end local v5    # "contactTitle":Ljava/lang/String;
    .end local v9    # "displayableRole":Ljava/lang/String;
    .end local v14    # "showContact":Landroid/widget/CheckBox;
    :pswitch_0
    const-string/jumbo v3, "administrator"

    .line 208
    .restart local v3    # "role":Ljava/lang/String;
    const v0, 0x7f0802d8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 209
    .restart local v9    # "displayableRole":Ljava/lang/String;
    goto :goto_0

    .line 211
    .end local v3    # "role":Ljava/lang/String;
    .end local v9    # "displayableRole":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v3, "moderator"

    .line 212
    .restart local v3    # "role":Ljava/lang/String;
    const v0, 0x7f0802db

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 213
    .restart local v9    # "displayableRole":Ljava/lang/String;
    goto :goto_0

    .line 215
    .end local v3    # "role":Ljava/lang/String;
    .end local v9    # "displayableRole":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v3, "editor"

    .line 216
    .restart local v3    # "role":Ljava/lang/String;
    const v0, 0x7f0802da

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 217
    .restart local v9    # "displayableRole":Ljava/lang/String;
    goto :goto_0

    .line 205
    :pswitch_data_0
    .packed-switch 0x7f100304
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 157
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 158
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 159
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 160
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 161
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 162
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 163
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 164
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 158
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 159
    goto :goto_1

    .line 166
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/high16 v6, 0x42000000    # 32.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 167
    .local v4, "pad":I
    :goto_2
    invoke-virtual {v5, v4, v7, v4, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 168
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 166
    goto :goto_2
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "profile"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    .line 54
    const v0, 0x7f0802be

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->setTitle(I)V

    .line 55
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->setHasOptionsMenu(Z)V

    .line 56
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 151
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 152
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->updateConfiguration()V

    .line 153
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->updateDecorator()V

    .line 154
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 73
    const v4, 0x7f0300c7

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 74
    .local v3, "v":Landroid/view/View;
    iput-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    .line 75
    const v4, 0x7f1002ba

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    const v4, 0x7f1001cc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, 0x7f0802bd

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    const v4, 0x7f1002e3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/CompoundRadioGroup;

    .line 79
    .local v0, "radoigroup":Lcom/vkontakte/android/ui/CompoundRadioGroup;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "role"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 80
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "role"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 91
    :goto_1
    const-string/jumbo v4, "creator"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "role"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 92
    const v4, 0x7f1002e1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 93
    const v4, 0x7f1002fe

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 102
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "contact_title"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    .line 103
    .local v1, "show":Z
    const v4, 0x7f100307

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 104
    .local v2, "showContact":Landroid/widget/CheckBox;
    new-instance v4, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 113
    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 114
    if-eqz v1, :cond_4

    .line 115
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v5, 0x7f100309

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "contact_title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    :cond_1
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v5, 0x7f1001e8

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 125
    const v4, 0x7f1002fe

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$2;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$2;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    return-object v3

    .line 80
    .end local v1    # "show":Z
    .end local v2    # "showContact":Landroid/widget/CheckBox;
    :sswitch_0
    const-string/jumbo v6, "administrator"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v4, 0x0

    goto/16 :goto_0

    :sswitch_1
    const-string/jumbo v6, "moderator"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v4, 0x1

    goto/16 :goto_0

    :sswitch_2
    const-string/jumbo v6, "editor"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v4, 0x2

    goto/16 :goto_0

    .line 82
    :pswitch_0
    const v4, 0x7f100306

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->setCheckedId(I)V

    goto/16 :goto_1

    .line 85
    :pswitch_1
    const v4, 0x7f100304

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->setCheckedId(I)V

    goto/16 :goto_1

    .line 88
    :pswitch_2
    const v4, 0x7f100305

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->setCheckedId(I)V

    goto/16 :goto_1

    .line 95
    :cond_2
    const v4, 0x7f1002fe

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 98
    :cond_3
    const v4, 0x7f100304

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CompoundRadioGroup;->setCheckedId(I)V

    .line 99
    const v4, 0x7f1002fe

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 117
    .restart local v1    # "show":Z
    .restart local v2    # "showContact":Landroid/widget/CheckBox;
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v5, 0x7f100309

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 118
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v5, 0x7f100308

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 119
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    const v5, 0x7f100308

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3

    .line 80
    :sswitch_data_0
    .sparse-switch
        -0x777d5afb -> :sswitch_1
        -0x4df3de93 -> :sswitch_2
        -0x26e03d33 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 287
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object v0

    .line 288
    .local v0, "dlg":Landroid/app/Dialog;
    const v1, 0x7f0802be

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setTitle(I)V

    .line 289
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 60
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 61
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 62
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 63
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 180
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/ToolbarFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 181
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->content:Landroid/view/View;

    const/high16 v2, 0x2000000

    invoke-virtual {v1, v2}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 182
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->updateConfiguration()V

    .line 183
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->updateDecorator()V

    .line 184
    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 197
    invoke-super {p0}, Lme/grishka/appkit/fragments/ToolbarFragment;->onDestroyView()V

    .line 198
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->view:Landroid/view/View;

    .line 199
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->save()V

    .line 68
    const/4 v0, 0x1

    return v0
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 147
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 172
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 173
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_split"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 176
    :cond_0
    return-void
.end method
