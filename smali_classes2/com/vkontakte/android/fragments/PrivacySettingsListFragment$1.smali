.class Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PrivacySettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/data/PrivacySection;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$null$0(Ljava/util/ArrayList;)V
    .locals 14
    .param p1, "result"    # Ljava/util/ArrayList;

    .prologue
    const/4 v13, 0x1

    const v12, 0x7f02005d

    const/4 v11, 0x2

    const/4 v10, 0x0

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v0, "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySection;

    .line 129
    .local v3, "section":Lcom/vkontakte/android/data/PrivacySection;
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 130
    iget-object v6, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$300(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 131
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v11, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    :cond_0
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v6, v13, :cond_2

    .line 137
    iget-object v6, v3, Lcom/vkontakte/android/data/PrivacySection;->title:Ljava/lang/String;

    invoke-static {v10, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    :goto_2
    iget-object v6, v3, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/PrivacySetting;

    .line 142
    .local v4, "setting":Lcom/vkontakte/android/data/PrivacySetting;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v7}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$408(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;)I

    move-result v1

    .line 143
    .local v1, "id":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v7}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$500(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;)Landroid/util/SparseArray;

    move-result-object v7

    invoke-virtual {v7, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 144
    new-instance v7, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    iget-object v9, v4, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    invoke-direct {v7, v8, v1, v9}, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;-><init>(Landroid/view/View$OnClickListener;ILjava/lang/Object;)V

    iget-object v8, v4, Lcom/vkontakte/android/data/PrivacySetting;->displayStringTmp:Ljava/lang/CharSequence;

    .line 145
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;->setSummary(Ljava/lang/Object;)Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;

    move-result-object v2

    .line 146
    .local v2, "ref":Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;
    invoke-static {v13, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 133
    .end local v1    # "id":I
    .end local v2    # "ref":Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;
    .end local v4    # "setting":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_1
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v11, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 139
    :cond_2
    iget-object v6, v3, Lcom/vkontakte/android/data/PrivacySection;->title:Ljava/lang/String;

    invoke-static {v10, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 148
    :cond_3
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v11, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 150
    .end local v3    # "section":Lcom/vkontakte/android/data/PrivacySection;
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v5, v0, v10}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$600(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;Ljava/util/List;Z)V

    .line 151
    return-void
.end method

.method synthetic lambda$success$1(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 6
    .param p1, "result"    # Ljava/util/ArrayList;
    .param p2, "r"    # Ljava/util/ArrayList;

    .prologue
    .line 117
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 118
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$000(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;)Landroid/util/SparseArray;

    move-result-object v4

    iget v5, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v5, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_0

    .line 120
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$100(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->getLists(Ljava/util/List;)V

    .line 121
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PrivacySection;

    .line 122
    .local v1, "section":Lcom/vkontakte/android/data/PrivacySection;
    iget-object v4, v1, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/PrivacySetting;

    .line 123
    .local v2, "setting":Lcom/vkontakte/android/data/PrivacySetting;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-static {v5, v2}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;->access$200(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;Lcom/vkontakte/android/data/PrivacySetting;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/data/PrivacySetting;->displayStringTmp:Ljava/lang/CharSequence;

    goto :goto_1

    .line 126
    .end local v1    # "section":Lcom/vkontakte/android/data/PrivacySection;
    .end local v2    # "setting":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_2
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 152
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 95
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/PrivacySection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PrivacySection;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 99
    .local v2, "neededUsers":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/PrivacySection;

    .line 100
    .local v4, "section":Lcom/vkontakte/android/data/PrivacySection;
    iget-object v9, v4, Lcom/vkontakte/android/data/PrivacySection;->settings:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/PrivacySetting;

    .line 101
    .local v5, "setting":Lcom/vkontakte/android/data/PrivacySetting;
    iget-object v10, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    .line 102
    .local v3, "rule":Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;
    instance-of v11, v3, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;

    if-eqz v11, :cond_2

    move-object v1, v3

    .line 103
    check-cast v1, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;

    .line 104
    .local v1, "l":Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;->userCount()I

    move-result v11

    if-ge v0, v11, :cond_2

    .line 105
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;->userIdAt(I)I

    move-result v6

    .line 106
    .local v6, "uid":I
    const v11, 0x77359400

    if-ge v6, v11, :cond_3

    .line 107
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v2, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 104
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 114
    .end local v0    # "i":I
    .end local v1    # "l":Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;
    .end local v3    # "rule":Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;
    .end local v4    # "section":Lcom/vkontakte/android/data/PrivacySection;
    .end local v5    # "setting":Lcom/vkontakte/android/data/PrivacySetting;
    .end local v6    # "uid":I
    :cond_4
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v7, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 116
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;Ljava/util/ArrayList;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 153
    return-void
.end method
