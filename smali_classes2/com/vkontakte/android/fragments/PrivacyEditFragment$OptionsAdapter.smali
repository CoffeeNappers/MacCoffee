.class Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PrivacyEditFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PrivacyEditFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OptionsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

.field private values:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V
    .locals 1

    .prologue
    .line 425
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 427
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->values:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/fragments/PrivacyEditFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$1;

    .prologue
    .line 425
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->values:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 466
    if-nez p1, :cond_0

    .line 467
    const/4 v0, 0x2

    .line 471
    :goto_0
    return v0

    .line 468
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_1

    .line 469
    const/4 v0, 0x4

    goto :goto_0

    .line 471
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 450
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 455
    if-nez p1, :cond_0

    .line 456
    const/16 v0, 0x14

    .line 460
    :goto_0
    return v0

    .line 457
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_1

    .line 458
    const/16 v0, 0x15

    goto :goto_0

    .line 460
    :cond_1
    const/16 v0, 0x16

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 425
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 3
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 443
    instance-of v0, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;

    if-eqz v0, :cond_0

    .line 444
    check-cast p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    add-int/lit8 v0, p2, -0x1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->access$500(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)I

    move-result v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->setChecked(Z)Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->values:Ljava/util/ArrayList;

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->bind(Ljava/lang/Object;)V

    .line 446
    :cond_0
    return-void

    .line 444
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 425
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 431
    packed-switch p2, :pswitch_data_0

    .line 437
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;)V

    :goto_0
    return-object v0

    .line 433
    :pswitch_0
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->blueTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$OptionsAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->getPrivacySettingsTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->withText(Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    goto :goto_0

    .line 435
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    const v1, 0x7f02005d

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;->setRes(I)Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    move-result-object v0

    goto :goto_0

    .line 431
    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
