.class public Lcom/vkontakte/android/fragments/ProfileEditFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "ProfileEditFragment.java"


# static fields
.field private static final AVA_RESULT:I = 0xf3d

.field private static final RELATION_PARTNER_RESULT:I = 0x65


# instance fields
.field private bdateVisSpinner:Landroid/widget/Spinner;

.field private bday:I

.field private bmonth:I

.field private byear:I

.field private cityID:I

.field private citySelector:Landroid/widget/TextView;

.field private countryAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/vkontakte/android/data/database/Country;",
            ">;"
        }
    .end annotation
.end field

.field private countrySpinner:Landroid/widget/Spinner;

.field private currentInfo:Landroid/os/Bundle;

.field private form:Landroid/view/View;

.field private gender:I

.field private ignoreCountryChange:Z

.field private receiver:Landroid/content/BroadcastReceiver;

.field private relationAdapter:Lcom/vkontakte/android/ui/adapters/RelationAdapter;

.field private relationPartner:Lcom/vkontakte/android/UserProfile;

.field private relationSpinner:Landroid/widget/Spinner;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->ignoreCountryChange:Z

    .line 90
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileEditFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$1;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setUserPhoto(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->ignoreCountryChange:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setRelationPartner(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/ProfileEditFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->ignoreCountryChange:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->deletePhoto()V

    return-void
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    return v0
.end method

.method static synthetic access$1402(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    return p1
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    return v0
.end method

.method static synthetic access$1502(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    return p1
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    return v0
.end method

.method static synthetic access$1602(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    return p1
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bdateVisSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Lcom/vkontakte/android/ui/adapters/RelationAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationAdapter:Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cityID:I

    return v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->showNameInfoDialog(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cityID:I

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countryAdapter:Landroid/widget/ArrayAdapter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->citySelector:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->selectCity()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->selectBirthDate()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->gender:I

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->gender:I

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->updateRelationOptions()V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    return-object v0
.end method

.method private cancelNameRequest()V
    .locals 3

    .prologue
    .line 462
    new-instance v0, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v2, "name_req_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;)V

    .line 463
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 470
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 471
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 472
    return-void
.end method

.method private deletePhoto()V
    .locals 3

    .prologue
    .line 662
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;

    .line 663
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 675
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 676
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 677
    return-void
.end method

.method private save()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v10, 0x0

    .line 522
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 523
    .local v4, "newInfo":Landroid/os/Bundle;
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v11, 0x7f1004d9

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 524
    .local v2, "firstName":Ljava/lang/String;
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v11, 0x7f1004da

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 525
    .local v3, "lastName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lt v9, v12, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v9, v12, :cond_1

    .line 526
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v11, 0x7f0806a4

    invoke-static {v9, v11, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    .line 622
    :goto_0
    return-void

    .line 529
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "first_name"

    invoke-virtual {v9, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "last_name"

    invoke-virtual {v9, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 530
    :cond_2
    const-string/jumbo v9, "first_name"

    invoke-virtual {v4, v9, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    const-string/jumbo v9, "last_name"

    invoke-virtual {v4, v9, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    :cond_3
    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->gender:I

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v12, "gender"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    if-eq v9, v11, :cond_4

    .line 534
    const-string/jumbo v9, "gender"

    iget v11, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->gender:I

    invoke-virtual {v4, v9, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 536
    :cond_4
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v9}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/Relation;

    .line 537
    .local v8, "relation":Lcom/vkontakte/android/Relation;
    iget v9, v8, Lcom/vkontakte/android/Relation;->id:I

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v12, "relation"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    if-eq v9, v11, :cond_5

    .line 538
    const-string/jumbo v9, "relation"

    iget v11, v8, Lcom/vkontakte/android/Relation;->id:I

    invoke-virtual {v4, v9, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 540
    :cond_5
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "relation_partner"

    invoke-virtual {v9, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 541
    .local v6, "relPartner":Lcom/vkontakte/android/UserProfile;
    if-eqz v6, :cond_c

    iget v5, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 542
    .local v5, "newRelPartnerId":I
    :goto_1
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationPartner:Lcom/vkontakte/android/UserProfile;

    if-eqz v9, :cond_d

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationPartner:Lcom/vkontakte/android/UserProfile;

    iget v7, v9, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 543
    .local v7, "relPartnerId":I
    :goto_2
    if-eq v7, v5, :cond_6

    .line 544
    const-string/jumbo v9, "relation_partner"

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationPartner:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 546
    :cond_6
    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "bday"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    if-ne v9, v10, :cond_7

    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "bmonth"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    if-ne v9, v10, :cond_7

    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "byear"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    if-eq v9, v10, :cond_8

    .line 547
    :cond_7
    const-string/jumbo v9, "bday"

    iget v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 548
    const-string/jumbo v9, "bmonth"

    iget v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 549
    const-string/jumbo v9, "byear"

    iget v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 551
    :cond_8
    const/4 v0, -0x1

    .line 552
    .local v0, "bdateVis":I
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bdateVisSpinner:Landroid/widget/Spinner;

    invoke-virtual {v9}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v9

    packed-switch v9, :pswitch_data_0

    .line 563
    :goto_3
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v10, "bdate_vis"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    if-eq v0, v9, :cond_9

    .line 564
    const-string/jumbo v9, "bdate_vis"

    invoke-virtual {v4, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 566
    :cond_9
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    invoke-virtual {v9}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/data/database/Country;

    iget v1, v9, Lcom/vkontakte/android/data/database/Country;->id:I

    .line 567
    .local v1, "country":I
    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v10, "country_id"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    if-eq v1, v9, :cond_a

    .line 568
    const-string/jumbo v9, "country_id"

    invoke-virtual {v4, v9, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 570
    :cond_a
    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cityID:I

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentInfo:Landroid/os/Bundle;

    const-string/jumbo v11, "city_id"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    if-eq v9, v10, :cond_b

    .line 571
    const-string/jumbo v9, "city_id"

    iget v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cityID:I

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 573
    :cond_b
    invoke-virtual {v4}, Landroid/os/Bundle;->size()I

    move-result v9

    if-nez v9, :cond_e

    .line 574
    const-string/jumbo v9, "vk"

    const-string/jumbo v10, "Nothing to save."

    invoke-static {v9, v10}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .end local v0    # "bdateVis":I
    .end local v1    # "country":I
    .end local v5    # "newRelPartnerId":I
    .end local v7    # "relPartnerId":I
    :cond_c
    move v5, v10

    .line 541
    goto/16 :goto_1

    .restart local v5    # "newRelPartnerId":I
    :cond_d
    move v7, v10

    .line 542
    goto/16 :goto_2

    .line 554
    .restart local v0    # "bdateVis":I
    .restart local v7    # "relPartnerId":I
    :pswitch_0
    const/4 v0, 0x1

    .line 555
    goto :goto_3

    .line 557
    :pswitch_1
    const/4 v0, 0x2

    .line 558
    goto :goto_3

    .line 560
    :pswitch_2
    const/4 v0, 0x0

    goto :goto_3

    .line 578
    .restart local v1    # "country":I
    :cond_e
    new-instance v9, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;

    invoke-direct {v9, v4}, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;-><init>(Landroid/os/Bundle;)V

    new-instance v10, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;

    invoke-direct {v10, p0, p0, v4}, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;Landroid/os/Bundle;)V

    .line 579
    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v9

    .line 620
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v9

    .line 621
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 552
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private selectBirthDate()V
    .locals 7

    .prologue
    const/4 v5, 0x1

    .line 489
    new-instance v0, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    const/16 v4, 0x76d

    if-lt v3, v4, :cond_1

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->byear:I

    .line 501
    :goto_0
    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    if-lez v4, :cond_2

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bmonth:I

    add-int/lit8 v4, v4, -0x1

    :goto_1
    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    if-lez v6, :cond_0

    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bday:I

    :cond_0
    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 502
    .local v0, "dpd":Landroid/app/DatePickerDialog;
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 519
    return-void

    .line 501
    .end local v0    # "dpd":Landroid/app/DatePickerDialog;
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, -0xe

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1
.end method

.method private selectCity()V
    .locals 4

    .prologue
    .line 270
    new-instance v1, Lcom/vkontakte/android/fragments/CitySelectFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/CitySelectFragment;-><init>()V

    .line 271
    .local v1, "fragment":Lcom/vkontakte/android/fragments/CitySelectFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 272
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "hint"

    const v3, 0x7f0801cd

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string/jumbo v3, "country"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/database/Country;

    iget v2, v2, Lcom/vkontakte/android/data/database/Country;->id:I

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 274
    const-string/jumbo v3, "show_none"

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cityID:I

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 275
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/CitySelectFragment;->setArguments(Landroid/os/Bundle;)V

    .line 276
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$10;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/CitySelectFragment;->setCallback(Lcom/vkontakte/android/fragments/DatabaseSearchFragment$Callback;)V

    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "city"

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/CitySelectFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 288
    return-void

    .line 274
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private setRelationPartner(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "p"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const v3, 0x7f1004e6

    const v1, 0x7f1004e5

    const v2, 0x7f1004e4

    .line 475
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationPartner:Lcom/vkontakte/android/UserProfile;

    .line 476
    if-eqz p1, :cond_0

    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 478
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 479
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationPartner:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 485
    :goto_0
    return-void

    .line 481
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0801db

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 482
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    .line 483
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private setUserPhoto(Ljava/lang/String;)V
    .locals 5
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    const v4, 0x7f1004d8

    const/16 v3, 0x8

    const/4 v2, 0x0

    const v1, 0x7f1001e8

    .line 680
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ".png"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ".gif"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 682
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 683
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 688
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v1, 0x7f1002cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$18;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 694
    return-void

    .line 685
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private showNameInfoDialog(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "finish"    # Z

    .prologue
    .line 625
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801d2

    .line 626
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 627
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    const/4 v3, 0x0

    .line 628
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 629
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 630
    .local v0, "dlg":Landroid/app/AlertDialog;
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;

    invoke-direct {v1, p0, p2}, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 639
    return-void
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 250
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v8, 0x7f1004d6

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 251
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 252
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 253
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 254
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 255
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 256
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 257
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 251
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 252
    goto :goto_1

    .line 259
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/16 v6, 0x10

    iget v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->scrW:I

    add-int/lit16 v8, v8, -0x348

    add-int/lit8 v8, v8, -0x54

    div-int/lit8 v8, v8, 0x2

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    int-to-float v6, v6

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 260
    .local v4, "pad":I
    :goto_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    invoke-virtual {v6, v4, v7, v4, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 261
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 259
    goto :goto_2
.end method

.method private updateRelationOptions()V
    .locals 6

    .prologue
    const/4 v1, 0x1

    .line 357
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Relation;

    .line 358
    .local v0, "relation":Lcom/vkontakte/android/Relation;
    new-instance v2, Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->gender:I

    if-eq v3, v1, :cond_1

    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f030068

    invoke-static {}, Lcom/vkontakte/android/Relation;->values()[Lcom/vkontakte/android/Relation;

    move-result-object v5

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;-><init>(ZLandroid/content/Context;I[Lcom/vkontakte/android/Relation;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationAdapter:Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    .line 359
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationAdapter:Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    const v2, 0x1090009

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->setDropDownViewResource(I)V

    .line 360
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationAdapter:Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 361
    if-eqz v0, :cond_0

    .line 362
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Lcom/vkontakte/android/Relation;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 364
    :cond_0
    return-void

    .line 358
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected doLoadData()V
    .locals 2

    .prologue
    .line 367
    new-instance v0, Lcom/vkontakte/android/api/account/AccountGetProfileInfo;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountGetProfileInfo;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;)V

    .line 368
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountGetProfileInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 458
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 459
    return-void
.end method

.method synthetic lambda$onCreateContentView$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 231
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->cancelNameRequest()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 304
    const/16 v0, 0x65

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 305
    const-string/jumbo v0, "user"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    .line 306
    .local v10, "p":Lcom/vkontakte/android/UserProfile;
    invoke-direct {p0, v10}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setRelationPartner(Lcom/vkontakte/android/UserProfile;)V

    .line 317
    .end local v10    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const/16 v0, 0xf3d

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 318
    const-string/jumbo v0, "cropLeft"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v5

    .line 319
    .local v5, "cropLeft":F
    const-string/jumbo v0, "cropTop"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v6

    .line 320
    .local v6, "cropTop":F
    const-string/jumbo v0, "cropRight"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v7

    .line 321
    .local v7, "cropRight":F
    const-string/jumbo v0, "cropBottom"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v8

    .line 322
    .local v8, "cropBottom":F
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v11

    new-instance v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "file"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    const/4 v4, 0x1

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V

    invoke-static {v11, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 324
    .end local v5    # "cropLeft":F
    .end local v6    # "cropTop":F
    .end local v7    # "cropRight":F
    .end local v8    # "cropBottom":F
    :cond_1
    const/16 v0, 0xf3d

    if-ne p1, v0, :cond_2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_2

    .line 325
    const-string/jumbo v0, "option"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 326
    .local v9, "idx":I
    if-nez v9, :cond_2

    .line 327
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 328
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801aa

    .line 329
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileEditFragment$11;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$11;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    .line 330
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 337
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 338
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 341
    .end local v9    # "idx":I
    :cond_2
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "a"    # Landroid/app/Activity;

    .prologue
    .line 115
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 116
    const v0, 0x7f0801da

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setTitle(I)V

    .line 117
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setHasOptionsMenu(Z)V

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->loadData()V

    .line 119
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 244
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 245
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->updateConfiguration()V

    .line 246
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->updateDecorator()V

    .line 247
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 105
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 106
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    const v7, 0x7f030068

    const v6, 0x1090009

    const/4 v5, 0x1

    .line 128
    const v3, 0x7f0301ce

    invoke-virtual {p1, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    .line 130
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bdateVisSpinner:Landroid/widget/Spinner;

    .line 131
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0c0008

    invoke-static {v3, v4, v7}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v0

    .line 132
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v0, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 133
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->bdateVisSpinner:Landroid/widget/Spinner;

    invoke-virtual {v3, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 135
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    .line 137
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e7

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    .line 138
    new-instance v3, Lcom/vkontakte/android/fragments/ProfileEditFragment$2;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, p0, v4, v7}, Lcom/vkontakte/android/fragments/ProfileEditFragment$2;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/content/Context;I)V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countryAdapter:Landroid/widget/ArrayAdapter;

    .line 147
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v3, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 148
    invoke-static {v5, v5, v8}, Lcom/vkontakte/android/data/database/Country;->getCountries(ZZLjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 149
    .local v2, "cc":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/database/Country;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/database/Country;

    .line 150
    .local v1, "c":Lcom/vkontakte/android/data/database/Country;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v4, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 152
    .end local v1    # "c":Lcom/vkontakte/android/data/database/Country;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 153
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->countrySpinner:Landroid/widget/Spinner;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$3;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 174
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e8

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->citySelector:Landroid/widget/TextView;

    .line 175
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->citySelector:Landroid/widget/TextView;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$4;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$4;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004df

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$5;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$5;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004dc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RadioGroup;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$6;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$6;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 197
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->relationSpinner:Landroid/widget/Spinner;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$7;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$7;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 211
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e6

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$8;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$8;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004e3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$9;-><init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const v4, 0x7f1004eb

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->setUserPhoto(Ljava/lang/String;)V

    .line 235
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    const/high16 v4, 0x2000000

    invoke-virtual {v3, v4}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->updateConfiguration()V

    .line 237
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->updateDecorator()V

    .line 239
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->form:Landroid/view/View;

    return-object v3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 292
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 293
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 294
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 295
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 110
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroy()V

    .line 111
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 112
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 299
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->save()V

    .line 300
    const/4 v0, 0x1

    return v0
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 644
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 345
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onResume()V

    .line 354
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 124
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 265
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 267
    return-void
.end method

.method public showUpdatePhotoDlg(Z)V
    .locals 5
    .param p1, "havePhotos"    # Z

    .prologue
    const/4 v4, 0x1

    .line 647
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 648
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "allow_album"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 649
    const-string/jumbo v2, "limit"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 650
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 651
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 653
    const v2, 0x7f08019c

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 654
    const-string/jumbo v2, "custom"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 656
    :cond_0
    const-string/jumbo v2, "no_thumbs"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 657
    const-string/jumbo v2, "force_thumb"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 658
    const/16 v2, 0xf3d

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 659
    return-void
.end method
