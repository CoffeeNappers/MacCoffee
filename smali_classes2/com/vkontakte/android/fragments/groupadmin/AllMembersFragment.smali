.class public Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
.super Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;
.source "AllMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$Holder;
    }
.end annotation


# instance fields
.field private receiver:Landroid/content/BroadcastReceiver;

.field private searchQuery:Ljava/lang/String;

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;-><init>()V

    .line 40
    new-instance v0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->openMakeManager(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->removeFromGroup(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->removeManager(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->banUser(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->performSearch(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method private banUser(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 241
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 242
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 243
    const-string/jumbo v1, "profile"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 244
    const-string/jumbo v1, "is_group_member"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 245
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->open(Landroid/os/Bundle;Landroid/app/Activity;)V

    .line 246
    return-void
.end method

.method private openMakeManager(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 187
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 188
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 189
    const-string/jumbo v1, "profile"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 190
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->open(Landroid/os/Bundle;Landroid/app/Activity;)V

    .line 191
    return-void
.end method

.method private performSearch(Ljava/lang/String;)V
    .locals 2
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    .line 168
    .local v0, "prevQuery":Ljava/lang/String;
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 169
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    .line 173
    :goto_0
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    if-nez v1, :cond_2

    :cond_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    if-eqz v1, :cond_2

    :cond_1
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    .line 174
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 175
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->reload()V

    .line 177
    :cond_3
    return-void

    .line 171
    :cond_4
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    goto :goto_0
.end method

.method private removeFromGroup(Lcom/vkontakte/android/UserProfile;)V
    .locals 6
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 218
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 219
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0802ec

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<b>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x3

    .line 220
    invoke-virtual {p1, v5}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</b>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    new-instance v2, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$5;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 221
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 236
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 237
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 238
    return-void
.end method

.method private removeManager(Lcom/vkontakte/android/UserProfile;)V
    .locals 6
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 194
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 195
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

    const/4 v5, 0x3

    .line 196
    invoke-virtual {p1, v5}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</b>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    new-instance v2, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$4;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$4;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 197
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 213
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 214
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 215
    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 8
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v4, 0x0

    .line 181
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsGetAdminMembers;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string/jumbo v5, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,education,city"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    if-nez v2, :cond_0

    const-string/jumbo v6, "time_desc"

    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchQuery:Ljava/lang/String;

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/groups/GroupsGetAdminMembers;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 182
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetAdminMembers;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 184
    return-void

    :cond_0
    move-object v6, v4

    .line 181
    goto :goto_0
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
    .line 250
    new-instance v0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$Holder;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 138
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;->onAttach(Landroid/app/Activity;)V

    .line 139
    const v0, 0x7f0802f9

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->setTitle(I)V

    .line 140
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->setHasOptionsMenu(Z)V

    .line 141
    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper;

    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$3;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;)V

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 157
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 123
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 124
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 125
    .local v0, "filter":Landroid/content/IntentFilter;
    sget-object v1, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_ADMIN_ADDED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 126
    sget-object v1, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_ADMIN_REMOVED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 128
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 164
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 132
    invoke-super {p0}, Lcom/vkontakte/android/fragments/groupadmin/AbsAdminUserListFragment;->onDestroy()V

    .line 133
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 134
    return-void
.end method

.method public onItemButtonClick(Landroid/view/View;Lcom/vkontakte/android/UserProfile;)V
    .locals 5
    .param p1, "button"    # Landroid/view/View;
    .param p2, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v4, 0x0

    .line 89
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 90
    .local v0, "menu":Landroid/widget/PopupMenu;
    iget-object v1, p2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "role"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 91
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0802df

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v4, v4, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 92
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x1

    const v3, 0x7f0802eb

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 93
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x3

    const v3, 0x7f080118

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 98
    :goto_0
    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$2;

    invoke-direct {v1, p0, p2}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment$2;-><init>(Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;Lcom/vkontakte/android/UserProfile;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 118
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 119
    return-void

    .line 95
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0801c7

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v4, v4, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 96
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x2

    const v3, 0x7f0802e9

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/groupadmin/AllMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_0
.end method
