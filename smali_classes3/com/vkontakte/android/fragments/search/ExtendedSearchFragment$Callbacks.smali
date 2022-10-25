.class Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;
.super Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;
.source "ExtendedSearchFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;
.implements Lcom/vkontakte/android/functions/VoidFloat;
.implements Lcom/vkontakte/android/functions/VoidFBool;
.implements Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Lcom/vkontakte/android/fragments/DatabaseSearchFragment$Callback;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Callbacks"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/text/TextWatcher;",
        "Landroid/widget/TextView$OnEditorActionListener;",
        "Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidFloat;",
        "Lcom/vkontakte/android/functions/VoidFBool;",
        "Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;",
        "Landroid/widget/CompoundButton$OnCheckedChangeListener;",
        "Lcom/vkontakte/android/fragments/DatabaseSearchFragment$Callback",
        "<",
        "Lcom/vkontakte/android/data/database/City;",
        ">;",
        "Landroid/widget/AdapterView$OnItemSelectedListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V
    .locals 0

    .prologue
    .line 361
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;

    .prologue
    .line 361
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 413
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 402
    return-void
.end method

.method public f(F)V
    .locals 2
    .param p1, "percent"    # F

    .prologue
    .line 437
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchIcon:Landroid/view/View;

    const/high16 v1, 0x43340000    # 180.0f

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 438
    return-void
.end method

.method public f(Z)V
    .locals 2
    .param p1, "opened"    # Z

    .prologue
    .line 429
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 430
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    .line 431
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateFilter()V

    .line 433
    :cond_0
    return-void
.end method

.method public getIndexChar(Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;)[C
    .locals 1
    .param p1, "from"    # Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    .prologue
    .line 384
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getIndexChar(Ljava/lang/Object;)[C
    .locals 1

    .prologue
    .line 361
    check-cast p1, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->getIndexChar(Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;)[C

    move-result-object v0

    return-object v0
.end method

.method public getSearchRequest(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<+",
            "Lme/grishka/appkit/api/PaginatedList",
            "<+",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 417
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 418
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "city"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 419
    const-string/jumbo v1, "country"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 420
    const-string/jumbo v1, "sex"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSex:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 421
    const-string/jumbo v1, "status"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRelation:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 422
    const-string/jumbo v1, "age_from"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 423
    const-string/jumbo v1, "age_to"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 424
    new-instance v1, Lcom/vkontakte/android/api/users/UsersSearch;

    invoke-direct {v1, p1, v0, p2, p3}, Lcom/vkontakte/android/api/users/UsersSearch;-><init>(Ljava/lang/String;Landroid/os/Bundle;II)V

    return-object v1
.end method

.method public matches(Ljava/lang/String;Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;)Z
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    .prologue
    .line 389
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic matches(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 361
    check-cast p2, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->matches(Ljava/lang/String;Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;)Z

    move-result v0

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 442
    if-eqz p2, :cond_0

    .line 443
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v0, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSex:I

    .line 444
    .local v0, "newGender":I
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 455
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSex:I

    if-eq v0, v1, :cond_0

    .line 456
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput v0, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSex:I

    .line 457
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    .line 460
    .end local v0    # "newGender":I
    :cond_0
    return-void

    .line 446
    .restart local v0    # "newGender":I
    :pswitch_0
    const/4 v0, 0x0

    .line 447
    goto :goto_0

    .line 449
    :pswitch_1
    const/4 v0, 0x2

    .line 450
    goto :goto_0

    .line 452
    :pswitch_2
    const/4 v0, 0x1

    goto :goto_0

    .line 444
    nop

    :pswitch_data_0
    .packed-switch 0x7f100520
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 366
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 380
    :goto_0
    return-void

    .line 368
    :sswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/utils/VoiceUtils;->startVoiceRecognizer(Landroid/app/Fragment;)V

    goto :goto_0

    .line 372
    :sswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 376
    :sswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->selectCity()V

    goto :goto_0

    .line 366
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100295 -> :sswitch_1
        0x7f100296 -> :sswitch_0
        0x7f10051f -> :sswitch_2
    .end sparse-switch
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 394
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 395
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p1}, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 396
    const/4 v1, 0x1

    return v1
.end method

.method public onError(Lme/grishka/appkit/api/ErrorResponse;Ljava/lang/String;II)V
    .locals 2
    .param p1, "error"    # Lme/grishka/appkit/api/ErrorResponse;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 531
    if-nez p3, :cond_0

    .line 532
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->loaded:Z

    .line 533
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 535
    :cond_0
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 477
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 522
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 479
    :pswitch_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v4, v4, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    int-to-long v4, v4

    cmp-long v4, v4, p4

    if-eqz v4, :cond_0

    .line 480
    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    long-to-int v5, p4

    iput v5, v4, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    .line 481
    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput v2, v4, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    .line 482
    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    const v5, 0x7f0801cd

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 483
    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v5, v5, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    if-lez v5, :cond_1

    move v2, v3

    :cond_1
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 484
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput-boolean v3, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    goto :goto_0

    .line 489
    :pswitch_2
    invoke-static {p4, p5}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v1

    .line 490
    .local v1, "relation":Lcom/vkontakte/android/Relation;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRelation:I

    iget v4, v1, Lcom/vkontakte/android/Relation;->id:I

    if-eq v2, v4, :cond_0

    .line 491
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v4, v1, Lcom/vkontakte/android/Relation;->id:I

    iput v4, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRelation:I

    .line 492
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput-boolean v3, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    goto :goto_0

    .line 497
    .end local v1    # "relation":Lcom/vkontakte/android/Relation;
    :pswitch_3
    if-lez p3, :cond_2

    add-int/lit8 v0, p3, 0xd

    .line 499
    .local v0, "age":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    if-eq v2, v0, :cond_0

    .line 500
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput v0, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    .line 501
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput-boolean v3, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    .line 502
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v3, v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    if-ge v2, v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    if-lez v2, :cond_0

    .line 503
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeToSpinner:Landroid/widget/Spinner;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v3, v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    add-int/lit8 v3, v3, -0xd

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_0

    .end local v0    # "age":I
    :cond_2
    move v0, v2

    .line 497
    goto :goto_1

    .line 511
    :pswitch_4
    if-lez p3, :cond_3

    add-int/lit8 v0, p3, 0xd

    .line 512
    .restart local v0    # "age":I
    :goto_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    if-eq v2, v0, :cond_0

    .line 513
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput v0, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    .line 514
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput-boolean v3, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    .line 515
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v3, v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    if-le v2, v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    if-lez v2, :cond_0

    .line 516
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFromSpinner:Landroid/widget/Spinner;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v3, v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    add-int/lit8 v3, v3, -0xd

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_0

    .end local v0    # "age":I
    :cond_3
    move v0, v2

    .line 511
    goto :goto_2

    .line 477
    nop

    :pswitch_data_0
    .packed-switch 0x7f10051e
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_2
    .end packed-switch
.end method

.method public onItemSelected(Lcom/vkontakte/android/data/database/City;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/data/database/City;

    .prologue
    .line 464
    iget v0, p1, Lcom/vkontakte/android/data/database/City;->id:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    if-eq v0, v1, :cond_0

    .line 465
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v1, p1, Lcom/vkontakte/android/data/database/City;->id:I

    iput v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    .line 466
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mChanged:Z

    .line 467
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    if-lez v0, :cond_1

    .line 468
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/database/City;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 473
    :cond_0
    :goto_0
    return-void

    .line 470
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    const v1, 0x7f0801cd

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method public bridge synthetic onItemSelected(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 361
    check-cast p1, Lcom/vkontakte/android/data/database/City;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->onItemSelected(Lcom/vkontakte/android/data/database/City;)V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 527
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onSuccess(Lme/grishka/appkit/api/PaginatedList;Ljava/lang/String;II)V
    .locals 2
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/grishka/appkit/api/PaginatedList",
            "<+",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 539
    .local p1, "result":Lme/grishka/appkit/api/PaginatedList;, "Lme/grishka/appkit/api/PaginatedList<+Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;>;"
    if-nez p3, :cond_0

    .line 540
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->loaded:Z

    .line 541
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->access$300(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V

    .line 542
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateList()V

    .line 544
    :cond_0
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 406
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mClear:Landroid/widget/ImageView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 407
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateFilter(Ljava/lang/String;)V

    .line 408
    return-void

    .line 406
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
