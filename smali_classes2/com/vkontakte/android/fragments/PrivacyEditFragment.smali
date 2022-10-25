.class public Lcom/vkontakte/android/fragments/PrivacyEditFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "PrivacyEditFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderAdapter;,
        Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderHackAdapter;,
        Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;,
        Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;,
        Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/vkontakte/android/fragments/BackListener;",
        "Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener",
        "<",
        "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALLOW_SELECT_RESULT:I = 0x65

.field private static final DENY_SELECT_RESULT:I = 0x66

.field private static final LIST_IMAGES:[I


# instance fields
.field private adapter:Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

.field private allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

.field private changed:Z

.field private checkedOption:I

.field private denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

.field private hasSome:Z

.field private optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

.field private setting:Lcom/vkontakte/android/data/PrivacySetting;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->LIST_IMAGES:[I

    return-void

    :array_0
    .array-data 4
        0x7f0201bb
        0x7f0201bc
        0x7f0201ba
        0x7f0201b8
        0x7f0201b9
        0x7f0201bd
        0x7f0201be
        0x7f0201bf
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 105
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 77
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 78
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->hasSome:Z

    .line 79
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    .line 106
    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    return v0
.end method

.method static synthetic access$600()[I
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->LIST_IMAGES:[I

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setToAllIfAllowedIsEmpty()V

    return-void
.end method

.method static synthetic access$802(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    return p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->isTablet:Z

    return v0
.end method

.method static synthetic lambda$showListOfCategories$4([ZLandroid/content/DialogInterface;IZ)V
    .locals 0
    .param p0, "states"    # [Z
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I
    .param p3, "b"    # Z

    .prologue
    .line 679
    aput-boolean p3, p0, p2

    .line 680
    return-void
.end method

.method private setToAllIfAllowedIsEmpty()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 340
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    .line 341
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 342
    iput v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 343
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->updateList()V

    .line 345
    :cond_0
    return-void
.end method

.method private showListOfCategories(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)V
    .locals 15
    .param p1, "userListAdapter"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    .prologue
    .line 645
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    .line 646
    .local v7, "context":Landroid/content/Context;
    if-nez v7, :cond_0

    .line 705
    :goto_0
    return-void

    .line 650
    :cond_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 651
    .local v8, "fl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 652
    .local v10, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 653
    .local v3, "itemsProfiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 656
    .local v6, "_states":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 657
    .local v12, "lists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Folder;>;"
    invoke-static {v12}, Lcom/vkontakte/android/data/Friends;->getLists(Ljava/util/List;)V

    .line 658
    invoke-static {v8}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 659
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/data/Friends$Folder;

    .line 660
    .local v11, "l":Lcom/vkontakte/android/data/Friends$Folder;
    new-instance v13, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v13}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 661
    .local v13, "p":Lcom/vkontakte/android/UserProfile;
    const v4, 0x77359400

    iget v14, v11, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    add-int/2addr v4, v14

    iput v4, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 662
    iget-object v4, v11, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    iput-object v4, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 663
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    iget-object v4, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    invoke-static/range {p1 .. p1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 669
    .end local v11    # "l":Lcom/vkontakte/android/data/Friends$Folder;
    .end local v13    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v1, v0, [Z

    .line 670
    .local v1, "states":[Z
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v2, v0, [Z

    .line 671
    .local v2, "oldStates":[Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v9, v0, :cond_2

    .line 672
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    aput-boolean v0, v1, v9

    .line 673
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    aput-boolean v0, v2, v9

    .line 671
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 676
    :cond_2
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0804b8

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 677
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$5;->lambdaFactory$([Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v14

    invoke-virtual {v4, v0, v1, v14}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v4, 0x7f080479

    const/4 v14, 0x0

    .line 680
    invoke-virtual {v0, v4, v14}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v4, 0x7f08011f

    const/4 v14, 0x0

    invoke-virtual {v0, v4, v14}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 681
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v5

    .line 682
    .local v5, "dlg":Landroid/app/AlertDialog;
    const/4 v0, -0x1

    invoke-virtual {v5, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v14

    move-object v0, p0

    move-object/from16 v4, p1

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;[Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0
.end method

.method private static usersToIds(Ljava/util/ArrayList;)[I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-nez p0, :cond_0

    const/4 v2, 0x0

    :goto_0
    new-array v1, v2, [I

    .line 129
    .local v1, "ids":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 130
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    aput v2, v1, v0

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 128
    .end local v0    # "i":I
    .end local v1    # "ids":[I
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    goto :goto_0

    .line 132
    .restart local v0    # "i":I
    .restart local v1    # "ids":[I
    :cond_1
    return-object v1
.end method


# virtual methods
.method protected beforeSetAdapter()V
    .locals 21

    .prologue
    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->adapter:Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    move-object/from16 v17, v0

    if-nez v17, :cond_12

    .line 170
    new-instance v17, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/fragments/PrivacyEditFragment$1;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    .line 171
    new-instance v17, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v18

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v19

    const/16 v20, 0x1

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    move/from16 v4, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/functions/VoidF0;Lcom/vkontakte/android/functions/VoidF0;Z)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    .line 175
    new-instance v17, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v18

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    move/from16 v4, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/functions/VoidF0;Lcom/vkontakte/android/functions/VoidF0;Z)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_8

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 180
    .local v16, "v":Ljava/lang/String;
    if-nez v16, :cond_0

    const-string/jumbo v16, ""

    .end local v16    # "v":Ljava/lang/String;
    :cond_0
    const/16 v17, -0x1

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->hashCode()I

    move-result v19

    sparse-switch v19, :sswitch_data_0

    :cond_1
    :goto_1
    packed-switch v17, :pswitch_data_0

    goto :goto_0

    .line 182
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 185
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 180
    :sswitch_0
    const-string/jumbo v19, "all"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v19, "friends"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v19, "friends_of_friends"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v19, "friends_of_friends_only"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x3

    goto/16 :goto_1

    :sswitch_4
    const-string/jumbo v19, "nobody"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x4

    goto/16 :goto_1

    :sswitch_5
    const-string/jumbo v19, "only_me"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x5

    goto/16 :goto_1

    :sswitch_6
    const-string/jumbo v19, "some"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    const/16 v17, 0x6

    goto/16 :goto_1

    .line 188
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 191
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 194
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 197
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 200
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS_ONLY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 203
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS_ONLY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 206
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->NOBODY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 210
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->NOBODY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 213
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->ONLY_ME:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 217
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    sget-object v19, Lcom/vkontakte/android/data/PrivacySetting;->ONLY_ME:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 220
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    new-instance v19, Lcom/vkontakte/android/data/PrivacySetting$Include;

    invoke-direct/range {v19 .. v19}, Lcom/vkontakte/android/data/PrivacySetting$Include;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->hasSome:Z

    goto/16 :goto_0

    .line 225
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_9

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-static/range {v17 .. v18}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 232
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->createHeaderViews()[Landroid/view/View;

    move-result-object v9

    .line 233
    .local v9, "headerView":[Landroid/view/View;
    array-length v0, v9

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x4

    move/from16 v0, v17

    new-array v7, v0, [Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 234
    .local v7, "adapters":[Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    const/4 v5, 0x0

    .line 235
    .local v5, "adapterIndex":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "adapterIndex":I
    .local v6, "adapterIndex":I
    new-instance v17, Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderHackAdapter;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderHackAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/fragments/PrivacyEditFragment$1;)V

    aput-object v17, v7, v5

    .line 236
    const/4 v10, 0x0

    .local v10, "i":I
    move v5, v6

    .end local v6    # "adapterIndex":I
    .restart local v5    # "adapterIndex":I
    :goto_3
    array-length v0, v9

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_a

    .line 237
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "adapterIndex":I
    .restart local v6    # "adapterIndex":I
    new-instance v17, Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderAdapter;

    aget-object v18, v9, v10

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$HeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Landroid/view/View;)V

    aput-object v17, v7, v5

    .line 236
    add-int/lit8 v10, v10, 0x1

    move v5, v6

    .end local v6    # "adapterIndex":I
    .restart local v5    # "adapterIndex":I
    goto :goto_3

    .line 229
    .end local v5    # "adapterIndex":I
    .end local v7    # "adapters":[Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .end local v9    # "headerView":[Landroid/view/View;
    .end local v10    # "i":I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    goto :goto_2

    .line 239
    .restart local v5    # "adapterIndex":I
    .restart local v7    # "adapters":[Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .restart local v9    # "headerView":[Landroid/view/View;
    .restart local v10    # "i":I
    :cond_a
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "adapterIndex":I
    .restart local v6    # "adapterIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    move-object/from16 v17, v0

    aput-object v17, v7, v5

    .line 240
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "adapterIndex":I
    .restart local v5    # "adapterIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    aput-object v17, v7, v6

    .line 241
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "adapterIndex":I
    .restart local v6    # "adapterIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    aput-object v17, v7, v5

    .line 242
    new-instance v17, Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    move-object/from16 v0, v17

    invoke-direct {v0, v7}, Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;-><init>([Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->adapter:Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    .line 243
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->hasSome:Z

    move/from16 v17, v0

    if-nez v17, :cond_b

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 246
    :cond_b
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 247
    .local v11, "lists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Folder;>;"
    invoke-static {v11}, Lcom/vkontakte/android/data/Friends;->getLists(Ljava/util/List;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_c
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_12

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    .line 249
    .local v14, "rule":Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;
    instance-of v0, v14, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;

    move/from16 v18, v0

    if-eqz v18, :cond_c

    move-object v12, v14

    .line 250
    check-cast v12, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;

    .line 251
    .local v12, "lr":Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;
    const/4 v10, 0x0

    :goto_4
    invoke-virtual {v12}, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;->userCount()I

    move-result v18

    move/from16 v0, v18

    if-ge v10, v0, :cond_c

    .line 252
    invoke-virtual {v12, v10}, Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;->userIdAt(I)I

    move-result v15

    .line 253
    .local v15, "uid":I
    const/4 v13, 0x0

    .line 254
    .local v13, "p":Lcom/vkontakte/android/UserProfile;
    const v18, 0x77359400

    move/from16 v0, v18

    if-ge v15, v0, :cond_f

    .line 255
    invoke-static {v15}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v13

    .line 266
    :cond_d
    :goto_5
    if-nez v13, :cond_e

    .line 267
    new-instance v13, Lcom/vkontakte/android/UserProfile;

    .end local v13    # "p":Lcom/vkontakte/android/UserProfile;
    invoke-direct {v13}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 269
    .restart local v13    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_e
    instance-of v0, v14, Lcom/vkontakte/android/data/PrivacySetting$Include;

    move/from16 v18, v0

    if-eqz v18, :cond_11

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    :goto_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 257
    :cond_f
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_10
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_d

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/data/Friends$Folder;

    .line 258
    .local v8, "f":Lcom/vkontakte/android/data/Friends$Folder;
    iget v0, v8, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    move/from16 v19, v0

    const v20, 0x77359400

    sub-int v20, v15, v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_10

    .line 259
    new-instance v13, Lcom/vkontakte/android/UserProfile;

    .end local v13    # "p":Lcom/vkontakte/android/UserProfile;
    invoke-direct {v13}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 260
    .restart local v13    # "p":Lcom/vkontakte/android/UserProfile;
    iput v15, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 261
    iget-object v0, v8, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-object v0, v13, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_5

    .line 272
    .end local v8    # "f":Lcom/vkontakte/android/data/Friends$Folder;
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 278
    .end local v6    # "adapterIndex":I
    .end local v7    # "adapters":[Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .end local v9    # "headerView":[Landroid/view/View;
    .end local v10    # "i":I
    .end local v11    # "lists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Folder;>;"
    .end local v12    # "lr":Lcom/vkontakte/android/data/PrivacySetting$UserListPrivacyRule;
    .end local v13    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v14    # "rule":Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;
    .end local v15    # "uid":I
    :cond_12
    return-void

    .line 180
    nop

    :sswitch_data_0
    .sparse-switch
        -0x73c81be9 -> :sswitch_2
        -0x4e4cdcf5 -> :sswitch_5
        -0x443b152c -> :sswitch_3
        -0x3e00811d -> :sswitch_4
        -0x23c4b66b -> :sswitch_1
        0x179a1 -> :sswitch_0
        0x35f4f4 -> :sswitch_6
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method protected createHeaderViews()[Landroid/view/View;
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 157
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 158
    .local v1, "t":Landroid/widget/TextView;
    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090147

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 159
    .local v0, "pad":I
    invoke-virtual {v1, v0, v4, v0, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 160
    const/high16 v2, 0x42900000    # 72.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 161
    const v2, -0x878686

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 163
    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v5, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 164
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v2, v2, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    new-array v2, v5, [Landroid/view/View;

    aput-object v1, v2, v4

    return-object v2
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 115
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 116
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->adapter:Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    if-nez v0, :cond_0

    .line 98
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->beforeSetAdapter()V

    .line 99
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->loadData()V

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->adapter:Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    return-object v0
.end method

.method protected getPrivacySettingsTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 422
    const v0, 0x7f08052b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/data/PrivacySetting;
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 362
    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    if-eqz v5, :cond_6

    .line 363
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 364
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    iget v6, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 365
    .local v3, "val":Ljava/lang/String;
    const/4 v5, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 396
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_5

    const-string/jumbo v5, "nobody"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string/jumbo v5, "only_me"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 397
    new-instance v0, Lcom/vkontakte/android/data/PrivacySetting$Exclude;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PrivacySetting$Exclude;-><init>()V

    .line 398
    .local v0, "excl":Lcom/vkontakte/android/data/PrivacySetting$Exclude;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 399
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget v6, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/data/PrivacySetting$Exclude;->add(I)V

    goto :goto_2

    .line 365
    .end local v0    # "excl":Lcom/vkontakte/android/data/PrivacySetting$Exclude;
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :sswitch_0
    const-string/jumbo v6, "all"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "friends"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v6, "friends_of_friends"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v6, "friends_of_friends_only"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v6, "nobody"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v6, "only_me"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x5

    goto/16 :goto_0

    :sswitch_6
    const-string/jumbo v6, "some"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x6

    goto/16 :goto_0

    .line 367
    :pswitch_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 370
    :pswitch_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 373
    :pswitch_2
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 376
    :pswitch_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->FRIENDS_OF_FRIENDS_ONLY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 379
    :pswitch_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->NOBODY:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 382
    :pswitch_5
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    sget-object v6, Lcom/vkontakte/android/data/PrivacySetting;->ONLY_ME:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 385
    :pswitch_6
    new-instance v1, Lcom/vkontakte/android/data/PrivacySetting$Include;

    invoke-direct {v1}, Lcom/vkontakte/android/data/PrivacySetting$Include;-><init>()V

    .line 386
    .local v1, "incl":Lcom/vkontakte/android/data/PrivacySetting$Include;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 387
    .restart local v2    # "p":Lcom/vkontakte/android/UserProfile;
    iget v6, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/data/PrivacySetting$Include;->add(I)V

    goto :goto_3

    .line 389
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {v1}, Lcom/vkontakte/android/data/PrivacySetting$Include;->userCount()I

    move-result v5

    if-nez v5, :cond_3

    .line 408
    .end local v1    # "incl":Lcom/vkontakte/android/data/PrivacySetting$Include;
    .end local v3    # "val":Ljava/lang/String;
    :cond_2
    :goto_4
    return-object v4

    .line 392
    .restart local v1    # "incl":Lcom/vkontakte/android/data/PrivacySetting$Include;
    .restart local v3    # "val":Ljava/lang/String;
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 401
    .end local v1    # "incl":Lcom/vkontakte/android/data/PrivacySetting$Include;
    .restart local v0    # "excl":Lcom/vkontakte/android/data/PrivacySetting$Exclude;
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    .end local v0    # "excl":Lcom/vkontakte/android/data/PrivacySetting$Exclude;
    :cond_5
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v5, v5, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 406
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    goto :goto_4

    .line 408
    .end local v3    # "val":Ljava/lang/String;
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    goto :goto_4

    .line 365
    nop

    :sswitch_data_0
    .sparse-switch
        -0x73c81be9 -> :sswitch_2
        -0x4e4cdcf5 -> :sswitch_5
        -0x443b152c -> :sswitch_3
        -0x3e00811d -> :sswitch_4
        -0x23c4b66b -> :sswitch_1
        0x179a1 -> :sswitch_0
        0x35f4f4 -> :sswitch_6
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method synthetic lambda$beforeSetAdapter$0()V
    .locals 2

    .prologue
    .line 171
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->usersToIds(Ljava/util/ArrayList;)[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setPresetUsers([I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const v1, 0x7f08052b

    .line 172
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x65

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 171
    return-void
.end method

.method synthetic lambda$beforeSetAdapter$1()V
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->showListOfCategories(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)V

    return-void
.end method

.method synthetic lambda$beforeSetAdapter$2()V
    .locals 2

    .prologue
    .line 175
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->usersToIds(Ljava/util/ArrayList;)[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setPresetUsers([I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const v1, 0x7f08052c

    .line 176
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 175
    return-void
.end method

.method synthetic lambda$beforeSetAdapter$3()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->showListOfCategories(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)V

    return-void
.end method

.method synthetic lambda$showListOfCategories$5([Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 5
    .param p1, "states"    # [Z
    .param p2, "oldStates"    # [Z
    .param p3, "itemsProfiles"    # Ljava/util/ArrayList;
    .param p4, "userListAdapter"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;
    .param p5, "dlg"    # Landroid/app/AlertDialog;
    .param p6, "view"    # Landroid/view/View;

    .prologue
    .line 683
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .local v0, "add":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 684
    .local v2, "remove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_2

    .line 685
    aget-boolean v3, p1, v1

    aget-boolean v4, p2, v1

    if-eq v3, v4, :cond_0

    .line 686
    aget-boolean v3, p2, v1

    if-eqz v3, :cond_1

    .line 687
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 688
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 684
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 691
    :cond_1
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 692
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 697
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 698
    :cond_3
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    .line 699
    invoke-static {p4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 700
    invoke-static {p4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 701
    invoke-virtual {p4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->notifyDataSetChanged()V

    .line 703
    :cond_4
    invoke-static {p5}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 704
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/16 v6, 0x65

    const/4 v5, 0x1

    .line 302
    const/4 v3, -0x1

    if-ne p2, v3, :cond_4

    .line 303
    const-string/jumbo v3, "result"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 304
    .local v2, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-ne p1, v6, :cond_6

    .line 305
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 306
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    .line 307
    .local v1, "p":Landroid/os/Parcelable;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v4

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .end local v1    # "p":Landroid/os/Parcelable;
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 309
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 310
    .local v0, "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 311
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 312
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 313
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 316
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_2
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    .line 331
    .end local v0    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->updateList()V

    .line 333
    .end local v2    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_4
    if-ne p1, v6, :cond_5

    .line 334
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setToAllIfAllowedIsEmpty()V

    .line 336
    :cond_5
    return-void

    .line 317
    .restart local v2    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_6
    const/16 v3, 0x66

    if-ne p1, v3, :cond_3

    .line 318
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 319
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    .line 320
    .local v1, "p":Landroid/os/Parcelable;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v4

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .end local v1    # "p":Landroid/os/Parcelable;
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 322
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 323
    .restart local v0    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    :cond_8
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 324
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 325
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 326
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_4

    .line 329
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_9
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    goto :goto_2
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 120
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "setting"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    .line 122
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setRefreshEnabled(Z)V

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->loaded:Z

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->showContent()V

    .line 125
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 110
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/content/Context;)V

    .line 111
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 148
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    .line 149
    const/4 v0, 0x1

    .line 152
    :goto_0
    return v0

    .line 151
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setResult()V

    .line 152
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 282
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 283
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f0f0024

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 284
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 413
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setResult()V

    .line 414
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroy()V

    .line 415
    return-void
.end method

.method public onRadioButtonClick(Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;)V
    .locals 3
    .param p1, "privacyRule"    # Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    .prologue
    .line 290
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->optionsAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    .line 291
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v1, v1, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    iget v2, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 292
    .local v0, "opt":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    const-string/jumbo v2, "some"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 293
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$200(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->updateList()V

    .line 297
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->changed:Z

    .line 298
    return-void
.end method

.method public bridge synthetic onRadioButtonClick(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 48
    check-cast p1, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->onRadioButtonClick(Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;)V

    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->canGoBack()Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onToolbarNavigationClick()V

    .line 143
    :goto_0
    return-void

    .line 140
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setResult()V

    .line 141
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onToolbarNavigationClick()V

    goto :goto_0
.end method

.method protected setResult()V
    .locals 5

    .prologue
    .line 418
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "setting"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getResult()Lcom/vkontakte/android/data/PrivacySetting;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 419
    return-void
.end method

.method public updateList()V
    .locals 6

    .prologue
    .line 349
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->setting:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v3, v3, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    iget v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->checkedOption:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 350
    .local v1, "opt":Ljava/lang/String;
    const/4 v0, 0x0

    .line 351
    .local v0, "hasLists":Z
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->allowAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 352
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget v4, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const v5, 0x77359400

    if-le v4, v5, :cond_0

    .line 353
    const/4 v0, 0x1

    .line 357
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->denyAdapter:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    const-string/jumbo v3, "only_me"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string/jumbo v3, "nobody"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string/jumbo v3, "some"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v0, :cond_3

    :cond_2
    const/4 v3, 0x1

    :goto_0
    invoke-static {v4, v3}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z

    .line 358
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateList()V

    .line 359
    return-void

    .line 357
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method
