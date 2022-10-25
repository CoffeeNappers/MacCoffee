.class Lcom/vkontakte/android/fragments/ProfileEditFragment$12;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 368
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "info"    # Landroid/os/Bundle;

    .prologue
    .line 371
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1302(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 373
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004d9

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const-string/jumbo v9, "first_name"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 374
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004da

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const-string/jumbo v9, "last_name"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const-string/jumbo v9, "gender"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$702(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 376
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004dd

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/RadioButton;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_4

    const/4 v9, 0x1

    :goto_0
    invoke-virtual {v8, v9}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 377
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004de

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/RadioButton;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_5

    const/4 v9, 0x1

    :goto_1
    invoke-virtual {v8, v9}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 378
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$800(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    .line 379
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const-string/jumbo v9, "bday"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1402(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 380
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const-string/jumbo v9, "bmonth"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1502(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 381
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const-string/jumbo v9, "byear"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1602(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 383
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v8

    if-lez v8, :cond_6

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v8

    const/16 v9, 0x20

    if-ge v8, v9, :cond_6

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v8

    if-lez v8, :cond_6

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v8

    const/16 v9, 0xd

    if-ge v8, v9, :cond_6

    .line 384
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c0016

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    aget-object v9, v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 385
    .local v2, "date":Ljava/lang/String;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v8

    if-lez v8, :cond_0

    .line 386
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 388
    :cond_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004df

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 393
    .end local v2    # "date":Ljava/lang/String;
    :goto_2
    const-string/jumbo v8, "bdate_vis"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 404
    :goto_3
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1100(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    const-string/jumbo v9, "relation"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    int-to-long v10, v9

    invoke-static {v10, v11}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/Relation;->ordinal()I

    move-result v9

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1800(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/Spinner;->setSelection(I)V

    .line 405
    const-string/jumbo v8, "relation_partner"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 406
    const-string/jumbo v8, "relation_partner"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/UserProfile;

    .line 407
    .local v7, "u":Lcom/vkontakte/android/UserProfile;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8, v7}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 415
    .end local v7    # "u":Lcom/vkontakte/android/UserProfile;
    :goto_4
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const/4 v9, 0x1

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$102(Lcom/vkontakte/android/fragments/ProfileEditFragment;Z)Z

    .line 416
    const-string/jumbo v8, "country_id"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 417
    .local v1, "countryID":I
    const/4 v3, 0x0

    .line 418
    .local v3, "found":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v8

    if-ge v4, v8, :cond_1

    .line 419
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/data/database/Country;

    iget v8, v8, Lcom/vkontakte/android/data/database/Country;->id:I

    if-ne v8, v1, :cond_a

    .line 420
    const/4 v3, 0x1

    .line 421
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/widget/Spinner;->setSelection(I)V

    .line 425
    :cond_1
    if-nez v3, :cond_2

    .line 426
    new-instance v0, Lcom/vkontakte/android/data/database/Country;

    invoke-direct {v0}, Lcom/vkontakte/android/data/database/Country;-><init>()V

    .line 427
    .local v0, "c":Lcom/vkontakte/android/data/database/Country;
    iput v1, v0, Lcom/vkontakte/android/data/database/Country;->id:I

    .line 428
    const-string/jumbo v8, "country_name"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/vkontakte/android/data/database/Country;->name:Ljava/lang/String;

    .line 429
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 430
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/ArrayAdapter;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v9}, Landroid/widget/Spinner;->setSelection(I)V

    .line 433
    .end local v0    # "c":Lcom/vkontakte/android/data/database/Country;
    :cond_2
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v9

    if-lez v1, :cond_b

    const/4 v8, 0x1

    :goto_6
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 435
    const-string/jumbo v8, "city_id"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    if-lez v8, :cond_3

    .line 436
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/TextView;

    move-result-object v8

    const-string/jumbo v9, "city_name"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const-string/jumbo v9, "city_id"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$202(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 440
    :cond_3
    const-string/jumbo v8, "name_req_status"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 441
    const-string/jumbo v8, "name_req_status"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 442
    .local v6, "status":I
    const/4 v8, 0x1

    if-ne v6, v8, :cond_d

    .line 443
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004ea

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const-string/jumbo v9, "name_req_name"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004e9

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const v9, 0x7f0801d5

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    .line 445
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004eb

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    const/4 v8, 0x1

    if-ne v6, v8, :cond_c

    const/4 v8, 0x0

    :goto_7
    invoke-virtual {v9, v8}, Landroid/view/View;->setVisibility(I)V

    .line 454
    .end local v6    # "status":I
    :goto_8
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->invalidateOptionsMenu()V

    .line 455
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->dataLoaded()V

    .line 456
    return-void

    .line 376
    .end local v1    # "countryID":I
    .end local v3    # "found":Z
    .end local v4    # "i":I
    :cond_4
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 377
    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 390
    :cond_6
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004df

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const v9, 0x7f08045c

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_2

    .line 395
    :pswitch_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_3

    .line 398
    :pswitch_1
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_3

    .line 401
    :pswitch_2
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/widget/Spinner;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_3

    .line 409
    :cond_7
    const-string/jumbo v8, "relation"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    int-to-long v8, v8

    invoke-static {v8, v9}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v8

    iget-boolean v5, v8, Lcom/vkontakte/android/Relation;->partner:Z

    .line 410
    .local v5, "show":Z
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004e2

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    if-eqz v5, :cond_8

    const/4 v8, 0x0

    :goto_9
    invoke-virtual {v9, v8}, Landroid/view/View;->setVisibility(I)V

    .line 411
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004e3

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    if-eqz v5, :cond_9

    const/4 v8, 0x0

    :goto_a
    invoke-virtual {v9, v8}, Landroid/view/View;->setVisibility(I)V

    .line 412
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Lcom/vkontakte/android/UserProfile;)V

    goto/16 :goto_4

    .line 410
    :cond_8
    const/16 v8, 0x8

    goto :goto_9

    .line 411
    :cond_9
    const/16 v8, 0x8

    goto :goto_a

    .line 418
    .end local v5    # "show":Z
    .restart local v1    # "countryID":I
    .restart local v3    # "found":Z
    .restart local v4    # "i":I
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_5

    .line 433
    :cond_b
    const/4 v8, 0x0

    goto/16 :goto_6

    .line 445
    .restart local v6    # "status":I
    :cond_c
    const/16 v8, 0x8

    goto/16 :goto_7

    .line 447
    :cond_d
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004e9

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v10, 0x7f0801d1

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004eb

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 449
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004ea

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    .line 452
    .end local v6    # "status":I
    :cond_e
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f1004d7

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    .line 393
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 368
    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$12;->success(Landroid/os/Bundle;)V

    return-void
.end method
