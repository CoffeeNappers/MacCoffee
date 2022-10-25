.class Lcom/vkontakte/android/GameCardActivity$Adapter;
.super Landroid/support/v13/app/FragmentPagerAdapter;
.source "GameCardActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/GameCardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Adapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/GameCardActivity;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/GameCardActivity;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 486
    iput-object p1, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    .line 487
    invoke-virtual {p1}, Lcom/vkontakte/android/GameCardActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v13/app/FragmentPagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 488
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v0}, Lcom/vkontakte/android/GameCardActivity;->access$000(Lcom/vkontakte/android/GameCardActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 492
    new-instance v2, Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/GameCardFragment;-><init>()V

    .line 493
    .local v2, "fragment":Lcom/vkontakte/android/fragments/GameCardFragment;
    iget-object v4, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-virtual {v4}, Lcom/vkontakte/android/GameCardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 494
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "visitSource"

    const-string/jumbo v5, "direct"

    invoke-static {v0, v4, v5}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 495
    .local v3, "vs":Ljava/lang/String;
    const-string/jumbo v4, "clickSource"

    const-string/jumbo v5, "catalog"

    invoke-static {v0, v4, v5}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 496
    .local v1, "cs":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v4}, Lcom/vkontakte/android/GameCardActivity;->access$000(Lcom/vkontakte/android/GameCardActivity;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v4, p1, v3, v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->createArgs(Lcom/vkontakte/android/data/ApiApplication;ILjava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/fragments/GameCardFragment;->setArguments(Landroid/os/Bundle;)V

    .line 497
    iget-object v4, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/fragments/GameCardFragment;->setOnListViewCreated(Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;)V

    .line 498
    return-object v2
.end method

.method synthetic lambda$notifyDataSetChanged$0()V
    .locals 2

    .prologue
    .line 518
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v0}, Lcom/vkontakte/android/GameCardActivity;->access$700(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/PageIndicator;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity$Adapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setCountOfPages(I)V

    return-void
.end method

.method public notifyDataSetChanged()V
    .locals 2

    .prologue
    .line 517
    invoke-super {p0}, Landroid/support/v13/app/FragmentPagerAdapter;->notifyDataSetChanged()V

    .line 518
    invoke-static {p0}, Lcom/vkontakte/android/GameCardActivity$Adapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/GameCardActivity$Adapter;)Ljava/lang/Runnable;

    move-result-object v0

    .line 519
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/GameCardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 520
    return-void
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 503
    invoke-super {p0, p1, p2, p3}, Landroid/support/v13/app/FragmentPagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 504
    if-eqz p3, :cond_0

    move-object v0, p3

    .line 505
    check-cast v0, Lcom/vkontakte/android/fragments/GameCardFragment;

    .line 506
    .local v0, "fragment":Lcom/vkontakte/android/fragments/GameCardFragment;
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity$Adapter;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->setOnListViewCreated(Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;)V

    .line 508
    .end local v0    # "fragment":Lcom/vkontakte/android/fragments/GameCardFragment;
    :cond_0
    return-void
.end method
